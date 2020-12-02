using FluentValidation;
using location.core.Commands;

namespace location.core.Validations
{
    public class UserRegistrationCommandValidator : AbstractValidator<UserRegistrationCommand>
    {
        public UserRegistrationCommandValidator()
        {
            RuleFor(x => x.Email)
                .Cascade(CascadeMode.Stop)
                .NotNull().WithMessage("{PropertyName} must not be null")
                .NotEmpty().WithMessage("{PropertyName} must not be empty")
                .EmailAddress().WithMessage("{PropertyName} must not be valid format email");

            RuleFor(x => x.Password)
                .Cascade(CascadeMode.Stop)
                .MinimumLength(8).WithMessage("{PropertyName} must not be at least 8 characters")
                .NotNull().WithMessage("{PropertyName} must not be null")
                .NotEmpty().WithMessage("{PropertyName} must not be empty");
        }
    }
}
