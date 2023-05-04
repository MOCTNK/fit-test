function getAnnuityPayments(loanSum, loanRate, loanTerm) {
    let result = []; // результат двумерный ассоциативный массив
    let shareLoanRate = loanRate / 12 / 100; // сотая часть от месячной процентной ставки
    /*Размер ежемясечного платежа*/
    let monthlyPayment = loanSum * (shareLoanRate + shareLoanRate / (Math.pow(1 + shareLoanRate, loanTerm) - 1));
    let remains = loanSum; // Остаток основного долга
    for(let i = 0; i < loanTerm; i++) {
        let debtPercent = remains * shareLoanRate; // Долг по процентам
        let debt = monthlyPayment - debtPercent; // Основной долг
        remains -= debt; // Вычисление остатка основного долга
        let resultMonthly = {
            'monthlyPayment': monthlyPayment.toFixed(2),
            'debt': debt.toFixed(2),
            'debtPercent': debtPercent.toFixed(2),
            'remains': Math.abs(remains.toFixed(2))
        };
        result.push(resultMonthly); // Добавление в результат данные за один месяц
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