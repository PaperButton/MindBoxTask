namespace FRIMindBoxTask1
{
    public class Triangle : Figure
    {
		private bool _cashedIsRightTriangle;

		public double EdgeA { get; }
		public double EdgeB { get; }
		public double EdgeC { get; }
		

		public Triangle(double edgeA, double edgeB, double edgeC)
		{
			if (edgeA < Constants.CalculationAccuracy)
				throw new ArgumentException("Задано слишком маленькое значение для стороны треугольника.", nameof(edgeA));

			if (edgeB < Constants.CalculationAccuracy)
				throw new ArgumentException("Задано слишком маленькое значение для стороны треугольника.", nameof(edgeB));

			if (edgeC < Constants.CalculationAccuracy)
				throw new ArgumentException("Задано слишком маленькое значение для стороны треугольника.", nameof(edgeC));

			var maxEdge = Math.Max(edgeA, Math.Max(edgeB, edgeC));
			var perimeter = edgeA + edgeB + edgeC;
			if (perimeter - maxEdge - maxEdge < Constants.CalculationAccuracy)
				throw new ArgumentException("Наибольшая сторона треугольника должна быть меньше суммы других сторон");

			EdgeA = edgeA;
			EdgeB = edgeB;
			EdgeC = edgeC;

		}
		public bool IsRightTriangle()
		{
			if (_cashedIsRightTriangle != default)
			{
				return _cashedIsRightTriangle;
			}

			double maxEdge = EdgeA, b = EdgeB, c = EdgeC;
			if (b - maxEdge > Constants.CalculationAccuracy)
				Utils.Swap(ref maxEdge, ref b);

			if (c - maxEdge > Constants.CalculationAccuracy)
				Utils.Swap(ref maxEdge, ref c);

			_cashedIsRightTriangle = Math.Abs(Math.Pow(maxEdge, 2) - Math.Pow(b, 2) - Math.Pow(c, 2)) < Constants.CalculationAccuracy;

			return _cashedIsRightTriangle;
		}

		public override double GetSquare()
        {
			if (_cashedSquare != default)
			{
				return _cashedSquare;
			}

			var halfP = (EdgeA + EdgeB + EdgeC) / 2d;
			var square = Math.Sqrt(
				halfP
				* (halfP - EdgeA)
				* (halfP - EdgeB)
				* (halfP - EdgeC)
			);

			_cashedSquare = square;

			return _cashedSquare;
		}
		
    }
}
