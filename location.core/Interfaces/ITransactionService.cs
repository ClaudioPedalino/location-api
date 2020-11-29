using location.entities;
using System.Threading.Tasks;

namespace location.core.Services.Interfaces
{
    public interface ITransactionService
    {
        Task<Transaction> CreateTransactionAsync(string userId, string userName, string clientIp, long duration);
    }
}