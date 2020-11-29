namespace location.core.Common
{
    public static class TemplateTransactionFormat
    {
        public static string GetTemplateTransaction(entities.Transaction register)
            => $@"[ TransactionId ]: {register.TransactionId} was succesfully completed --
[ UserId ]: {register.UserId}  -  [ UserName ]: {register.UserName}  -  [ ClientIp ]: {register.ClientIP} - 
[ RequestDate ]: {register.Date} and the proccess take {register.Duration} ms";
    }
}
