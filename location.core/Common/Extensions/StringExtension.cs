using System;
using System.Globalization;
using System.Text;

namespace location.core.Common.Extensions
{
    public static class StringExtension
    {
        public static string EnumFormatter(this String str)
            => str.Replace('_', ' ').RemoveAccents().Lowered();

        public static string Lowered(this String str)
            => str.Trim().ToLower();

        public static string RemoveAccents(this String str)
        {
            var normalizedString = str.Normalize(NormalizationForm.FormD);
            var stringBuilder = new StringBuilder();

            foreach (var c in normalizedString)
            {
                var unicodeCategory = CharUnicodeInfo.GetUnicodeCategory(c);
                if (unicodeCategory != UnicodeCategory.NonSpacingMark)
                {
                    stringBuilder.Append(c);
                }
            }

            return stringBuilder.ToString().Normalize(NormalizationForm.FormC);
        }

        public static bool ToBoolean(this String str)
            => str.ToLower().Equals(Enums.Boolean.True.ToString().ToLower());

    }
}
