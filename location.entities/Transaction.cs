using System;

namespace location.entities
{
    public class Transaction
    {
        public Guid TransactionId { get; set; }
        public string UserId { get; set; }
        public string UserName { get; set; }
        public string ClientIP { get; set; }
        public DateTime Date { get; set; }
        public long Duration { get; set; }

    }
}
