namespace FRIMindBoxTask1
{
    public class Circle : Figure
    {
        public const double MinRadius = 1e-6;
        public double Radius { get; }
        public Circle(double radius)
        {
            if (radius - MinRadius < Constants.CalculationAccuracy)
                throw new ArgumentException("Нельзя указывать радиус меньше минимального размера.", nameof(radius));

            Radius = radius;
        }
        public override double GetSquare()
        {
            if (_cashedSquare != default)
            {
                return _cashedSquare;
            }

            _cashedSquare = Math.PI * Math.Pow(Radius, 2);

            return _cashedSquare;
        }
    }
}
