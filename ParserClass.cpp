#include "ParserClass.h"

ParserClass::ParserClass(const QString &calculationData)
    : m_expression(calculationData), m_pos(0)
{
    tokenize();
}

cpp_dec_float_50 ParserClass::evaluate()
{
    m_pos = 0;
    cpp_dec_float_50 result = parseExpression();

    if (!check(TokenType::End))
        throw std::runtime_error("Unexpected token at end of expression");

    return result;
}

QString ParserClass::evaluateToString(int precision)
{
    cpp_dec_float_50 value = evaluate();

    std::string str = value.str(precision, std::ios_base::fixed);

    if (str.find('.') != std::string::npos)
    {
        while (!str.empty() && str.back() == '0')
            str.pop_back();

        if (!str.empty() && str.back() == '.')
            str.pop_back();
    }

    return QString::fromStdString(str);
}

void ParserClass::tokenize()
{
    m_tokens.clear();
    int i = 0;

    while (i < m_expression.length())
    {
        QChar ch = m_expression[i];

        if (ch.isSpace())
        {
            ++i;
            continue;
        }

        if (ch.isDigit() || ch == '.')
        {
            QString number;
            while (i < m_expression.length() &&
                   (m_expression[i].isDigit() || m_expression[i] == '.'))
            {
                number += m_expression[i];
                ++i;
            }
            m_tokens.append({TokenType::Number, number});
            continue;
        }

        switch (ch.unicode())
        {
        case '+': m_tokens.append({TokenType::Plus, "+"}); break;
        case '-': m_tokens.append({TokenType::Minus, "-"}); break;
        case '*': m_tokens.append({TokenType::Mul, "*"}); break;
        case '/': m_tokens.append({TokenType::Div, "/"}); break;
        case '%': m_tokens.append({TokenType::Mod, "%"}); break;
        case '(': m_tokens.append({TokenType::LParen, "("}); break;
        case ')': m_tokens.append({TokenType::RParen, ")"}); break;
        default:
            throw std::runtime_error("Invalid character in expression");
        }

        ++i;
    }

    m_tokens.append({TokenType::End, ""});
}

cpp_dec_float_50 ParserClass::parseExpression()
{
    cpp_dec_float_50 value = parseTerm();

    while (true)
    {
        if (match(TokenType::Plus))
            value += parseTerm();
        else if (match(TokenType::Minus))
            value -= parseTerm();
        else
            break;
    }

    return value;
}

cpp_dec_float_50 ParserClass::parseTerm()
{
    cpp_dec_float_50 value = parseFactor();

    while (true)
    {
        if (match(TokenType::Mul))
        {
            value *= parseFactor();
        }
        else if (match(TokenType::Div))
        {
            cpp_dec_float_50 divisor = parseFactor();
            if (divisor == 0)
                throw std::runtime_error("Division by zero");
            value /= divisor;
        }
        else if (match(TokenType::Mod))
        {
            cpp_dec_float_50 divisor = parseFactor();
            if (divisor == 0)
                throw std::runtime_error("Modulo by zero");

            value = fmod(value, divisor);
        }
        else
        {
            break;
        }
    }

    return value;
}

cpp_dec_float_50 ParserClass::parseFactor()
{
    if (match(TokenType::Minus))
        return -parseFactor();

    if (match(TokenType::Number))
        return cpp_dec_float_50(previous().text.toStdString());

    if (match(TokenType::LParen))
    {
        cpp_dec_float_50 value = parseExpression();
        if (!match(TokenType::RParen))
            throw std::runtime_error("Expected ')'");
        return value;
    }

    throw std::runtime_error("Unexpected token");
}

bool ParserClass::match(TokenType type)
{
    if (check(type))
    {
        advance();
        return true;
    }
    return false;
}

bool ParserClass::check(TokenType type) const
{
    if (m_pos >= m_tokens.size())
        return false;

    return m_tokens[m_pos].type == type;
}

const ParserClass::Token &ParserClass::advance()
{
    if (m_pos < m_tokens.size())
        ++m_pos;
    return previous();
}

const ParserClass::Token &ParserClass::previous() const
{
    return m_tokens[m_pos - 1];
}