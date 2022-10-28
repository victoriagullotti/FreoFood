using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShoppingHeart
{
    class PaymentGateway : IPaymentGateway
    {
        public PaymentGateway()
        {
            //StripeConfiguration.SetApiKey(StripeApiKeys.Value);
        }
    }
}
