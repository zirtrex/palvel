var autoComplete = Vue.component('auto-complete', {
	template: `
      	<div class="auto-complete">
    		<input type="hidden" v-model="codigo">
			<input class="uk-input" type="hidden" v-model="unidadMedida">
       		<input class="uk-input" type="text" v-model="input" @keydown.tab.prevent="complete()" @focus="focus(true)" @blur="focus(false)" v-bind="$attrs">
       		<ul v-if="focused" class="uk-list uk-list-divider uk-list-striped">
    	     	<li v-for="(person, i) in data" v-if="filter(person)" @mousedown="complete(i)">
          	      <p>{{ person[field1] }} ({{ person[field3] || '' }})</p>
        	    </li>
        	 </ul>
    	</div>`,

	props: {
	  	//codigoin: { type: String, required: false},
      	value: { type: String, required: false},
      	data:  { type: Array, required: true},
      	field1: { type: String, required: true},
      	field2: { type: String, required: true},
				field3: { type: String, required: false}
  },

  methods: {
       complete(i) {
       		 if (i == undefined) {
           	   for (let row of this.data) {
            		if (this.filter(row)) {
                    	this.select(row)
                    	return
                  	}
               }
           }
           this.select(this.data[i])
       },

       select(row) {
       	  	this.input = row[this.field1] + " (" + (row[this.field3] || '') + ")";
          	this.codigo = row[this.field2];
         		this.unidadMedida = row[this.field3];
          	this.selected = true;
          	this.$emit('newdata', [this.codigo, this.input, this.unidadMedida]);
       },

       filter(row) {
       		return row[this.field1].toLowerCase().indexOf(this.input.toLowerCase()) != -1
       },

       focus(f) {
       		this.focused = f
       }
  },

  data() {
       return {
           codigo: 0,
           input: '',
           unidadMedida: '',
           focused: false
       }
  },

  created() {
		//this.codigo = this.codigoin || 0
		this.codigo =  0
		this.input = this.value || ''
		this.unidadMedida = this.field3 || ''

  },

  watch: {
  	input: {
    	handler: function() {
        	//if(this.input == 0) this.$emit('newdata', [0, '', '']);
    			//this.$emit('newdata', [this.codigo, this.input, this.unidadMedida]);
      	},
    	deep: true
    }
  }
});
