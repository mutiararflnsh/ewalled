// let bb;
// let tb;

// bb = 68;
// tb = 168;

// let tb_meter = tb/100;
// console.log(tb_meter)

// let bmi = bb / tb_meter**2;
// let result = `BMI : ${bmi}`;
// console.log(result);

// function greetings(nama){
//     return `Halo ${nama}`
//     }

// let greet = greetings("Bubu");
// console.log(greet);

//Object
// const ktp = {
//     nik: 35150782931,
//     nama: "Bubu",
//     isMarried: false,
//     greetings: () => {
//         console.log("Good Morning")
//     }
// }

// console.log(ktp.nama);

let shopDetail = {
  name: "Perimin",
  location: "Sydney",
  inventory: [
    {
      name: "Harry Potter 1",
      price: 10,
      quantity: 6,
    },
    {
      name: "Harry Potter 2",
      price: 15,
      quantity: 2,
    },
  ],
};

const addProduct = (nama, harga, quantity) => {
  const newObject = {
    name: nama,
    price: harga,
    quantity: quantity,
  };

  shopDetail.inventory.push(newObject);

  return shopDetail.inventory;
};

const sellProduct = (name, quantity) => {
  const updateStock = shopDetail.inventory.map((obj) => {
    if (obj.name === name) {
      if (obj.quantity >= quantity) {
        return { ...obj, quantity: obj.quantity - quantity };
      }
    }
    return obj;
  });

  shopDetail.inventory = updateStock;
  return updateStock;
};

const checkStock = (name) => {
  const stockByName = shopDetail.inventory.find((obj) => obj.name === name);

  return stockByName.quantity;
};

const showInventory = () => {
  return shopDetail.inventory;
};

//   console.log('tambah: ', addProduct('Donut', 8, 2))
//   console.log('sell:' ,sellProduct('Croissant', 2))
console.log("check stock:", checkStock("Harry Potter 1"));
//   console.log('show inventory:',showInventory())
