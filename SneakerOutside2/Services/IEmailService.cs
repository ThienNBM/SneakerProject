using SneakerOutside2.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SneakerOutside2.Services
{
    public interface IEmailService
    {
        bool SendEmailRegister(EmailRegister emailRegister);

        bool SendEmailCheckout(EmailCheckout emailCheckout);
    }
}
