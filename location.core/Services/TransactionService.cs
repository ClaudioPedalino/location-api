using location.core.Services.Interfaces;
using location.entities;
using System;
using System.Threading.Tasks;

namespace location.core.Services
{
    public class TransactionService : ITransactionService
    {

        public async Task<Transaction> CreateTransactionAsync(string userId, string userName, string clientIp, long duration)
        {
            var transaction = new Transaction()
            {
                TransactionId = Guid.NewGuid(),
                UserId = userId,
                UserName = userName,
                ClientIP = clientIp,
                Date = DateTime.Now,
                Duration = duration
            };

            return await Task.FromResult(transaction);
        }
    }
}
