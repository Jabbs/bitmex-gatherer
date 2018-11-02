class AllUsers extends React.Component {
  render() {
    const users = this.props.users.map((user) => {
      return(
        <div key={user.id}>
          <h4>{user.name}</h4>
        </div>
      );
    });
    return(
      <div>
        {users}
      </div>
    );
  }
}
