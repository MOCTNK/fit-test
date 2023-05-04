function getAnnuityPayments(loanSum, loanRate, loanTerm) {
    let result = [];
    let shareLoanRate = loanRate / 12 / 100;
    let monthlyPayment = loanSum * (shareLoanRate + shareLoanRate / (Math.pow(1 + shareLoanRate, loanTerm) - 1));
    let remains = loanSum;
    for(let i = 0; i < loanTerm; i++) {
        let debtPercent = remains * shareLoanRate;
        let debt = monthlyPayment - debtPercent;
        remains -= debt;
        let resultMonthly = {
            'monthlyPayment': monthlyPayment.toFixed(2),
            'debt': debt.toFixed(2),
            'debtPercent': debtPercent.toFixed(2),
            'remains': Math.abs(remains.toFixed(2))
        };
        result.push(resultMonthly);
    }
    return result;
}

function printAnnuityPayments(loanSum, loanRate, loanTerm) {
    console.log("Сумма кредита: "+loanSum);
    console.log("Ставка: "+loanRate+"%");
    console.log("Срок: "+loanTerm);
    console.log("Месяц | Ежемесячный платеж | Основной долг | Долг по процентам | Остаток основного долга");
    let result = getAnnuityPayments(loanSum, loanRate, loanTerm);
    for(let i = 0; i < result.length; i++) {
        let resultMonthly = result[i]
        console.log((i + 1)
            +" | "+resultMonthly.monthlyPayment
            +" | "+resultMonthly.debt
            +" | "+resultMonthly.debtPercent
            +" | "+resultMonthly.remains);
    }
}

printAnnuityPayments(100000, 13, 12);