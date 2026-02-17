#ifndef MYCALC_PARSERCLASS_H
#define MYCALC_PARSERCLASS_H

#include <QString>
#include <QVector>
#include <stdexcept>

class ParserClass
{
public:
    explicit ParserClass(const QString &calculationData);

    double evaluate();

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

    double parseExpression();
    double parseTerm();
    double parseFactor();

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
