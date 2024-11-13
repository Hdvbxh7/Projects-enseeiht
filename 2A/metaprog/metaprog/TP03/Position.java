import java.util.Objects;

/** Définir une position.  */
public class Position {
	private int x;
	private int y;



	@Override public String toString() {
		return super.toString() + "(" + x + "," + y + ")";
	}
	@Override
	public int hashCode() {
		return Objects.hash(x, y);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Position other = (Position) obj;
		return x == other.x && y == other.y;
	}
}
