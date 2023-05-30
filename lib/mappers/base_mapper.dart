abstract class BaseMapper<D, M> {
  M mapToModel(D data);
  D mapToDto(M model);
}
