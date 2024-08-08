abstract class BaseMapper<D, M>{
  M fromDto(D dto);
  D toDto(M model);
}