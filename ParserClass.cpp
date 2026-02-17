#include "ParserClass.h"
#include <QChar>
#include <cmath>

ParserClass::ParserClass(const QString &calculationData)
    : m_expression(calculationData), m_pos(0)
{}

double ParserClass::evaluate()
{
    tokenize();
    m_pos = 0;
    return parseExpression();
}

void ParserClass::tokenize()
{
    m_tokens.clear();
    int pos = 0;

    while (pos < m_expression.length())
    {
        QChar c = m_expression[pos];

        if (c.isSpace()) { pos++; continue; }

        if (c.isDigit() || c == '.')
        {
            QString numberStr;
            bool dotSeen = false;

            while (pos < m_expression.length() &&
                   (m_expression[pos].isDigit() || m_expression[pos] == '.'))
            {
                if (m_expression[pos] == '.')
                {
                    if (dotSeen) throw std::runtime_error("Invalid number format");
                    dotSeen = true;
                }
                numberStr += m_expression[pos++];
            }

            m_tokens.append({TokenType::Number, numberStr});
        }
        else
        {
            switch (c.unicode())
            {
                case '+': m_tokens.append({TokenType::Plus, ""}); pos++; break;
                case '-': m_tokens.append({TokenType::Minus, ""}); pos++; break;
                case '*': m_tokens.append({TokenType::Mul, ""}); pos++; break;
                case '/': m_tokens.append({TokenType::Div, ""}); pos++; break;
                case '%': m_tokens.append({TokenType::Mod, ""}); pos++; break;
                case '(': m_tokens.append({TokenType::LParen, ""}); pos++; break;
                case ')': m_tokens.append({TokenType::RParen, ""}); pos++; break;
                default:
                    throw std::runtime_error(QString("Unexpected character: %1").arg(c).toStdString());
            }
        }
    }

    m_tokens.append({TokenType::End, ""});
}

// ===== Parser =====

double ParserClass::parseExpression()
{
    double value = parseTerm();

    while (match(TokenType::Plus) || match(TokenType::Minus))
    {
        TokenType op = previous().type;
        double right = parseTerm();
        if (op == TokenType::Plus) value += right;
        else value -= right;
    }

    return value;
}

double ParserClass::parseTerm()
{
    double value = parseFactor();

    while (match(TokenType::Mul) || match(TokenType::Div) || match(TokenType::Mod))
    {
        TokenType op = previous().type;
        double right = parseFactor();

        if (op == TokenType::Mul) value *= right;
        else if (op == TokenType::Div)
        {
            if (right == 0) throw std::runtime_error("Division by zero");
            value /= right;
        }
        else // Mod
        {
            if (right == 0) throw std::runtime_error("Modulo by zero");
            value = fmod(value, right);
        }
    }

    return value;
}

double ParserClass::parseFactor()
{
    if (match(TokenType::Minus)) return -parseFactor();

    if (match(TokenType::Number))
        return previous().text.toDouble();

    if (match(TokenType::LParen))
    {
        double value = parseExpression();
        if (!match(TokenType::RParen))
            throw std::runtime_error("Expected closing parenthesis");
        return value;
    }

    throw std::runtime_error("Unexpected token");
}

// ===== Helpers =====

bool ParserClass::match(TokenType type)
{
    if (check(type)) { advance(); return true; }
    return false;
}

bool ParserClass::check(TokenType type) const
{
    return m_tokens[m_pos].type == type;
}

const ParserClass::Token &ParserClass::advance()
{
    return m_tokens[m_pos++];
}

const ParserClass::Token &ParserClass::previous() const
{
    return m_tokens[m_pos - 1];
}
