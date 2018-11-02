class Body extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      users: []
    };
  }

  componentDidMount(){
    fetch('/api/v1/users.json')
      .then((response) => {return response.json()})
      .then((data) => {this.setState({ users: data }) });
  }

  render(){
    return(
      <div>
        <AllUsers users={this.state.users} />
      </div>
    );
  }
}
