<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
  </div>
</template>

<script lang="ts">
import { Options, Vue } from 'vue-class-component';
import Axios from 'axios'
import { Sample } from '../types/sample';

@Options({
  props: {
    msg: String
  }
})
export default class HelloWorld extends Vue {
  msg!: string

  public mounted(): void {
    Axios.defaults.baseURL = process.env.VUE_APP_API_ENDPOINT ?? "localhost";
    Axios.get<Sample.Response>("api/sample").then((r) => this.msg = r.data.message).catch((r) => this.msg = r.data);
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
