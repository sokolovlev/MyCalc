#ifndef MYCALC_PARSERCLASS_H
#define MYCALC_PARSERCLASS_H

#include <QString>
#include <QVector>
#include <stdexcept>
#include <boost/multiprecision/cpp_dec_float.hpp>

using boost::multiprecision::cpp_dec_float_50;

class ParserClass
{
public:
    explicit ParserClass(const QString &calculationData);

    cpp_dec_float_50 evaluate();

    QString evaluateToString(int precision = 25);

private:
    enum class TokenType
    {
        Number,
        Plus,
        Minus,
        Mul,
        Div,
        Mod,
        LParen,
        RParen,
        End
    };

    struct Token
    {
        TokenType type;
        QString text;
    };

    void tokenize();

    cpp_dec_float_50 parseExpression();
    cpp_dec_float_50 parseTerm();
    cpp_dec_float_50 parseFactor();

    bool match(TokenType type);
    bool check(TokenType type) const;
    const Token &advance();
    const Token &previous() const;

private:
    QString m_expression;
    QVector<Token> m_tokens;
    int m_pos;
};

#endif // MYCALC_PARSERCLASS_H