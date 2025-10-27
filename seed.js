const mongoose = require('mongoose');
require('dotenv').config();

const Product = require('./models/Product');
const FeaturedProduct = require('./models/FeaturedProduct');
const Video = require('./models/Video');

const seedProducts = [
  {
    name: 'Mygate Locks Door Sensor',
    description: 'Smart door sensor for your smart home',
    price: 1490,
    originalPrice: 2990,
    image: 'https://via.placeholder.com/300x300/FFFFFF/000000?text=Door+Sensor',
    category: 'accessories',
    inStock: true
  },
  {
    name: 'Mygate Wifi Gateway',
    description: 'Connect your smart home to the internet',
    price: 3990,
    originalPrice: 4990,
    image: 'https://via.placeholder.com/300x300/FFFFFF/000000?text=Wifi+Gateway',
    category: 'accessories',
    inStock: true
  },
  {
    name: 'Mygate Smart Lock',
    description: 'Keyless entry for your home',
    price: 5990,
    originalPrice: 7990,
    image: 'https://via.placeholder.com/300x300/FFFFFF/000000?text=Smart+Lock',
    category: 'locks',
    inStock: true
  },
  {
    name: 'Mygate Motion Sensor',
    description: 'Detect motion in your home',
    price: 1290,
    originalPrice: 2490,
    image: 'https://via.placeholder.com/300x300/FFFFFF/000000?text=Motion+Sensor',
    category: 'sensors',
    inStock: true
  }
];

const seedFeatured = {
  title: 'mygate DOORBELLS',
  subtitle: 'A lot happens at your front door.',
  name: 'Video Doorbell',
  status: 'Coming soon...',
  image: 'https://via.placeholder.com/400x400/FFFFFF/000000?text=Video+Doorbell',
  active: true
};

const seedVideos = [
  {
    title: 'Locks installation guide. Mygate Lock installation: The en...',
    description: 'Mygate Lock installation: The essential guide',
    thumbnail: 'https://via.placeholder.com/300x200/8B7D6B/FFFFFF?text=Lock+Installation',
    category: 'tutorial',
    active: true
  },
  {
    title: 'The Smart Lock purchase index: All you need to know',
    description: 'Everything you need to know about smart locks',
    thumbnail: 'https://via.placeholder.com/300x200/6B8E23/FFFFFF?text=Smart+Lock+Guide',
    category: 'tutorial',
    active: true
  }
];

async function seed() {
  try {
    // Connect to MongoDB
    await mongoose.connect(process.env.MONGODB_URI || 'mongodb://localhost:27017/smartdevices', {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    });
    console.log('Connected to MongoDB');

    // Clear existing data
    await Product.deleteMany({});
    console.log('Cleared existing products');

    // Insert new products
    const products = await Product.insertMany(seedProducts);
    console.log(`Inserted ${products.length} products`);

    // Clear and insert featured product
    await FeaturedProduct.deleteMany({});
    const featured = await FeaturedProduct.create(seedFeatured);
    console.log('Inserted featured product');

    // Clear and insert videos
    await Video.deleteMany({});
    const videos = await Video.insertMany(seedVideos);
    console.log(`Inserted ${videos.length} videos`);

    console.log('Database seeded successfully!');
    process.exit(0);
  } catch (error) {
    console.error('Error seeding database:', error);
    process.exit(1);
  }
}

seed();


