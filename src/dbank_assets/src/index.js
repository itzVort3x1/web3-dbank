import { dbank } from '../../declarations/dbank';

async function updateBalance() {
     const currentAmount = await dbank.checkBalance();
     document.getElementById('value').innerText = currentAmount.toFixed(2);
}

window.addEventListener('load', function () {
     updateBalance();
});

document.querySelector('form').addEventListener('submit', async function (e) {
     e.preventDefault();

     const button = e.target.querySelector('#submit-btn');

     const inputAmount = document.getElementById('input-amount').value;
     const withdrawAmount = document.getElementById('withdrawal-amount').value;

     button.setAttribute('disabled', true);

     if (inputAmount > 0) {
          await dbank.topUP(parseFloat(inputAmount));
          document.getElementById('input-amount').value = '';
     }

     if (withdrawAmount > 0) {
          await dbank.withdraw(parseFloat(withdrawAmount));
          document.getElementById('withdrawal-amount').value = '';
     }

     await dbank.compound();

     updateBalance();
     button.removeAttribute('disabled');
});