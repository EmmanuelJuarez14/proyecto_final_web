-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-06-2024 a las 07:25:59
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ecommerce`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)   SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '25f9e794323b453885f5181f1b624d0b');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'HP'),
(2, 'Samsung'),
(3, 'Apple'),
(4, 'motorolla'),
(5, 'LG'),
(6, 'Cloth Brand');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(6, 26, '::1', 4, 1),
(9, 10, '::1', 7, 1),
(10, 11, '::1', 7, 1),
(11, 45, '::1', 7, 1),
(44, 5, '::1', 3, 0),
(46, 2, '::1', 3, 0),
(48, 72, '::1', 3, 0),
(49, 60, '::1', 8, 1),
(50, 61, '::1', 8, 1),
(51, 1, '::1', 8, 1),
(52, 5, '::1', 9, 1),
(53, 2, '::1', 14, 1),
(54, 3, '::1', 14, 1),
(55, 5, '::1', 14, 1),
(56, 1, '::1', 9, 1),
(57, 2, '::1', 9, 1),
(71, 61, '127.0.0.1', -1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Electronics'),
(2, 'Ladies Wears'),
(3, 'Mens Wear'),
(4, 'Kids Wear'),
(5, 'Furnitures'),
(6, 'Home Appliances'),
(7, 'Electronics Gadgets');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(4, 'puneethreddy951@gmail.com'),
(5, 'puneethreddy@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_image`, `product_keywords`, `description`, `stock`) VALUES
(1, 0, 0, 'Essence Mascara Lash Princess', 10, 'https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png', 'beauty, mascara', 'The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.', 5),
(2, 0, 0, 'Eyeshadow Palette with Mirror', 20, 'https://cdn.dummyjson.com/products/images/beauty/Eyeshadow%20Palette%20with%20Mirror/thumbnail.png', 'beauty, eyeshadow', 'The Eyeshadow Palette with Mirror offers a versatile range of eyeshadow shades for creating stunning eye looks. With a built-in mirror, it\'s convenient for on-the-go makeup application.', 44),
(3, 0, 0, 'Powder Canister', 15, 'https://cdn.dummyjson.com/products/images/beauty/Powder%20Canister/thumbnail.png', 'beauty, face powder', 'The Powder Canister is a finely milled setting powder designed to set makeup and control shine. With a lightweight and translucent formula, it provides a smooth and matte finish.', 59),
(4, 0, 0, 'Red Lipstick', 13, 'https://cdn.dummyjson.com/products/images/beauty/Red%20Lipstick/thumbnail.png', 'beauty, lipstick', 'The Red Lipstick is a classic and bold choice for adding a pop of color to your lips. With a creamy and pigmented formula, it provides a vibrant and long-lasting finish.', 68),
(5, 0, 0, 'Red Nail Polish', 9, 'https://cdn.dummyjson.com/products/images/beauty/Red%20Nail%20Polish/thumbnail.png', 'beauty, nail polish', 'The Red Nail Polish offers a rich and glossy red hue for vibrant and polished nails. With a quick-drying formula, it provides a salon-quality finish at home.', 71),
(6, 0, 0, 'Calvin Klein CK One', 50, 'https://cdn.dummyjson.com/products/images/fragrances/Calvin%20Klein%20CK%20One/thumbnail.png', 'fragrances, perfumes', 'CK One by Calvin Klein is a classic unisex fragrance, known for its fresh and clean scent. It\'s a versatile fragrance suitable for everyday wear.', 17),
(7, 0, 0, 'Chanel Coco Noir Eau De', 130, 'https://cdn.dummyjson.com/products/images/fragrances/Chanel%20Coco%20Noir%20Eau%20De/thumbnail.png', 'fragrances, perfumes', 'Coco Noir by Chanel is an elegant and mysterious fragrance, featuring notes of grapefruit, rose, and sandalwood. Perfect for evening occasions.', 41),
(8, 0, 0, 'Dior J\'adore', 90, 'https://cdn.dummyjson.com/products/images/fragrances/Dior%20J\'adore/thumbnail.png', 'fragrances, perfumes', 'J\'adore by Dior is a luxurious and floral fragrance, known for its blend of ylang-ylang, rose, and jasmine. It embodies femininity and sophistication.', 91),
(9, 0, 0, 'Dolce Shine Eau de', 70, 'https://cdn.dummyjson.com/products/images/fragrances/Dolce%20Shine%20Eau%20de/thumbnail.png', 'fragrances, perfumes', 'Dolce Shine by Dolce & Gabbana is a vibrant and fruity fragrance, featuring notes of mango, jasmine, and blonde woods. It\'s a joyful and youthful scent.', 3),
(10, 0, 0, 'Gucci Bloom Eau de', 80, 'https://cdn.dummyjson.com/products/images/fragrances/Gucci%20Bloom%20Eau%20de/thumbnail.png', 'fragrances, perfumes', 'Gucci Bloom by Gucci is a floral and captivating fragrance, with notes of tuberose, jasmine, and Rangoon creeper. It\'s a modern and romantic scent.', 93),
(11, 0, 0, 'Annibale Colombo Bed', 1900, 'https://cdn.dummyjson.com/products/images/furniture/Annibale%20Colombo%20Bed/thumbnail.png', 'furniture, beds', 'The Annibale Colombo Bed is a luxurious and elegant bed frame, crafted with high-quality materials for a comfortable and stylish bedroom.', 47),
(12, 0, 0, 'Annibale Colombo Sofa', 2500, 'https://cdn.dummyjson.com/products/images/furniture/Annibale%20Colombo%20Sofa/thumbnail.png', 'furniture, sofas', 'The Annibale Colombo Sofa is a sophisticated and comfortable seating option, featuring exquisite design and premium upholstery for your living room.', 16),
(13, 0, 0, 'Bedside Table African Cherry', 300, 'https://cdn.dummyjson.com/products/images/furniture/Bedside%20Table%20African%20Cherry/thumbnail.png', 'furniture, bedside tables', 'The Bedside Table in African Cherry is a stylish and functional addition to your bedroom, providing convenient storage space and a touch of elegance.', 16),
(14, 0, 0, 'Knoll Saarinen Executive Conference Chair', 500, 'https://cdn.dummyjson.com/products/images/furniture/Knoll%20Saarinen%20Executive%20Conference%20Chair/thumbnail.png', 'furniture, office chairs', 'The Knoll Saarinen Executive Conference Chair is a modern and ergonomic chair, perfect for your office or conference room with its timeless design.', 47),
(15, 0, 0, 'Wooden Bathroom Sink With Mirror', 800, 'https://cdn.dummyjson.com/products/images/furniture/Wooden%20Bathroom%20Sink%20With%20Mirror/thumbnail.png', 'furniture, bathroom', 'The Wooden Bathroom Sink with Mirror is a unique and stylish addition to your bathroom, featuring a wooden sink countertop and a matching mirror.', 95),
(16, 0, 0, 'Apple', 2, 'https://cdn.dummyjson.com/products/images/groceries/Apple/thumbnail.png', 'fruits', 'Fresh and crisp apples, perfect for snacking or incorporating into various recipes.', 9),
(17, 0, 0, 'Beef Steak', 13, 'https://cdn.dummyjson.com/products/images/groceries/Beef%20Steak/thumbnail.png', 'meat', 'High-quality beef steak, great for grilling or cooking to your preferred level of doneness.', 96),
(18, 0, 0, 'Cat Food', 9, 'https://cdn.dummyjson.com/products/images/groceries/Cat%20Food/thumbnail.png', 'pet supplies, cat food', 'Nutritious cat food formulated to meet the dietary needs of your feline friend.', 13),
(19, 0, 0, 'Chicken Meat', 10, 'https://cdn.dummyjson.com/products/images/groceries/Chicken%20Meat/thumbnail.png', 'meat', 'Fresh and tender chicken meat, suitable for various culinary preparations.', 69),
(20, 0, 0, 'Cooking Oil', 5, 'https://cdn.dummyjson.com/products/images/groceries/Cooking%20Oil/thumbnail.png', 'cooking essentials', 'Versatile cooking oil suitable for frying, sautÃ©ing, and various culinary applications.', 22),
(21, 0, 0, 'Cucumber', 1, 'https://cdn.dummyjson.com/products/images/groceries/Cucumber/thumbnail.png', 'vegetables', 'Crisp and hydrating cucumbers, ideal for salads, snacks, or as a refreshing side.', 22),
(22, 0, 0, 'Dog Food', 11, 'https://cdn.dummyjson.com/products/images/groceries/Dog%20Food/thumbnail.png', 'pet supplies, dog food', 'Specially formulated dog food designed to provide essential nutrients for your canine companion.', 40),
(23, 0, 0, 'Eggs', 3, 'https://cdn.dummyjson.com/products/images/groceries/Eggs/thumbnail.png', 'dairy', 'Fresh eggs, a versatile ingredient for baking, cooking, or breakfast.', 10),
(24, 0, 0, 'Fish Steak', 15, 'https://cdn.dummyjson.com/products/images/groceries/Fish%20Steak/thumbnail.png', 'seafood', 'Quality fish steak, suitable for grilling, baking, or pan-searing.', 99),
(25, 0, 0, 'Green Bell Pepper', 1, 'https://cdn.dummyjson.com/products/images/groceries/Green%20Bell%20Pepper/thumbnail.png', 'vegetables', 'Fresh and vibrant green bell pepper, perfect for adding color and flavor to your dishes.', 89),
(26, 0, 0, 'Green Chili Pepper', 1, 'https://cdn.dummyjson.com/products/images/groceries/Green%20Chili%20Pepper/thumbnail.png', 'vegetables', 'Spicy green chili pepper, ideal for adding heat to your favorite recipes.', 8),
(27, 0, 0, 'Honey Jar', 7, 'https://cdn.dummyjson.com/products/images/groceries/Honey%20Jar/thumbnail.png', 'condiments', 'Pure and natural honey in a convenient jar, perfect for sweetening beverages or drizzling over food.', 25),
(28, 0, 0, 'Ice Cream', 5, 'https://cdn.dummyjson.com/products/images/groceries/Ice%20Cream/thumbnail.png', 'desserts', 'Creamy and delicious ice cream, available in various flavors for a delightful treat.', 76),
(29, 0, 0, 'Juice', 4, 'https://cdn.dummyjson.com/products/images/groceries/Juice/thumbnail.png', 'beverages', 'Refreshing fruit juice, packed with vitamins and great for staying hydrated.', 99),
(30, 0, 0, 'Kiwi', 2, 'https://cdn.dummyjson.com/products/images/groceries/Kiwi/thumbnail.png', 'fruits', 'Nutrient-rich kiwi, perfect for snacking or adding a tropical twist to your dishes.', 1),
(31, 0, 0, 'Lemon', 1, 'https://cdn.dummyjson.com/products/images/groceries/Lemon/thumbnail.png', 'fruits', 'Zesty and tangy lemons, versatile for cooking, baking, or making refreshing beverages.', 0),
(32, 0, 0, 'Milk', 3, 'https://cdn.dummyjson.com/products/images/groceries/Milk/thumbnail.png', 'dairy', 'Fresh and nutritious milk, a staple for various recipes and daily consumption.', 57),
(33, 0, 0, 'Mulberry', 5, 'https://cdn.dummyjson.com/products/images/groceries/Mulberry/thumbnail.png', 'fruits', 'Sweet and juicy mulberries, perfect for snacking or adding to desserts and cereals.', 79),
(34, 0, 0, 'Nescafe Coffee', 8, 'https://cdn.dummyjson.com/products/images/groceries/Nescafe%20Coffee/thumbnail.png', 'beverages, coffee', 'Quality coffee from Nescafe, available in various blends for a rich and satisfying cup.', 22),
(35, 0, 0, 'Potatoes', 2, 'https://cdn.dummyjson.com/products/images/groceries/Potatoes/thumbnail.png', 'vegetables', 'Versatile and starchy potatoes, great for roasting, mashing, or as a side dish.', 8),
(36, 0, 0, 'Protein Powder', 20, 'https://cdn.dummyjson.com/products/images/groceries/Protein%20Powder/thumbnail.png', 'health supplements', 'Nutrient-packed protein powder, ideal for supplementing your diet with essential proteins.', 65),
(37, 0, 0, 'Red Onions', 2, 'https://cdn.dummyjson.com/products/images/groceries/Red%20Onions/thumbnail.png', 'vegetables', 'Flavorful and aromatic red onions, perfect for adding depth to your savory dishes.', 86),
(38, 0, 0, 'Rice', 6, 'https://cdn.dummyjson.com/products/images/groceries/Rice/thumbnail.png', 'grains', 'High-quality rice, a staple for various cuisines and a versatile base for many dishes.', 49),
(39, 0, 0, 'Soft Drinks', 2, 'https://cdn.dummyjson.com/products/images/groceries/Soft%20Drinks/thumbnail.png', 'beverages', 'Assorted soft drinks in various flavors, perfect for refreshing beverages.', 78),
(40, 0, 0, 'Strawberry', 4, 'https://cdn.dummyjson.com/products/images/groceries/Strawberry/thumbnail.png', 'fruits', 'Sweet and succulent strawberries, great for snacking, desserts, or blending into smoothies.', 9),
(41, 0, 0, 'Tissue Paper Box', 2, 'https://cdn.dummyjson.com/products/images/groceries/Tissue%20Paper%20Box/thumbnail.png', 'household essentials', 'Convenient tissue paper box for everyday use, providing soft and absorbent tissues.', 97),
(42, 0, 0, 'Water', 1, 'https://cdn.dummyjson.com/products/images/groceries/Water/thumbnail.png', 'beverages', 'Pure and refreshing bottled water, essential for staying hydrated throughout the day.', 95),
(43, 0, 0, 'Decoration Swing', 60, 'https://cdn.dummyjson.com/products/images/home-decoration/Decoration%20Swing/thumbnail.png', 'home decor, swing', 'The Decoration Swing is a charming addition to your home decor. Crafted with intricate details, it adds a touch of elegance and whimsy to any room.', 62),
(44, 0, 0, 'Family Tree Photo Frame', 30, 'https://cdn.dummyjson.com/products/images/home-decoration/Family%20Tree%20Photo%20Frame/thumbnail.png', 'home decor, photo frame', 'The Family Tree Photo Frame is a sentimental and stylish way to display your cherished family memories. With multiple photo slots, it tells the story of your loved ones.', 34),
(45, 0, 0, 'House Showpiece Plant', 40, 'https://cdn.dummyjson.com/products/images/home-decoration/House%20Showpiece%20Plant/thumbnail.png', 'home decor, artificial plants', 'The House Showpiece Plant is an artificial plant that brings a touch of nature to your home without the need for maintenance. It adds greenery and style to any space.', 89),
(46, 0, 0, 'Plant Pot', 15, 'https://cdn.dummyjson.com/products/images/home-decoration/Plant%20Pot/thumbnail.png', 'home decor, plant accessories', 'The Plant Pot is a stylish container for your favorite plants. With a sleek design, it complements your indoor or outdoor garden, adding a modern touch to your plant display.', 70),
(47, 0, 0, 'Table Lamp', 50, 'https://cdn.dummyjson.com/products/images/home-decoration/Table%20Lamp/thumbnail.png', 'home decor, lighting', 'The Table Lamp is a functional and decorative lighting solution for your living space. With a modern design, it provides both ambient and task lighting, enhancing the atmosphere.', 84),
(48, 0, 0, 'Bamboo Spatula', 8, 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Bamboo%20Spatula/thumbnail.png', 'kitchen tools, utensils', 'The Bamboo Spatula is a versatile kitchen tool made from eco-friendly bamboo. Ideal for flipping, stirring, and serving various dishes.', 0),
(49, 0, 0, 'Black Aluminium Cup', 6, 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Black%20Aluminium%20Cup/thumbnail.png', 'drinkware, cups', 'The Black Aluminium Cup is a stylish and durable cup suitable for both hot and cold beverages. Its sleek black design adds a modern touch to your drinkware collection.', 42),
(50, 0, 0, 'Black Whisk', 10, 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Black%20Whisk/thumbnail.png', 'kitchen tools, utensils', 'The Black Whisk is a kitchen essential for whisking and beating ingredients. Its ergonomic handle and sleek design make it a practical and stylish tool.', 17),
(51, 0, 0, 'Boxed Blender', 40, 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Boxed%20Blender/thumbnail.png', 'kitchen appliances, blenders', 'The Boxed Blender is a powerful and compact blender perfect for smoothies, shakes, and more. Its convenient design and multiple functions make it a versatile kitchen appliance.', 81),
(52, 0, 0, 'Carbon Steel Wok', 30, 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Carbon%20Steel%20Wok/thumbnail.png', 'cookware, woks', 'The Carbon Steel Wok is a versatile cooking pan suitable for stir-frying, sautÃ©ing, and deep frying. Its sturdy construction ensures even heat distribution for delicious meals.', 2),
(53, 0, 0, 'Chopping Board', 13, 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Chopping%20Board/thumbnail.png', 'kitchen tools, cutting boards', 'The Chopping Board is an essential kitchen accessory for food preparation. Made from durable material, it provides a safe and hygienic surface for cutting and chopping.', 53),
(54, 0, 0, 'Citrus Squeezer Yellow', 9, 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Citrus%20Squeezer%20Yellow/thumbnail.png', 'kitchen tools, juicers', 'The Citrus Squeezer in Yellow is a handy tool for extracting juice from citrus fruits. Its vibrant color adds a cheerful touch to your kitchen gadgets.', 59),
(55, 0, 0, 'Egg Slicer', 7, 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Egg%20Slicer/thumbnail.png', 'kitchen tools, slicers', 'The Egg Slicer is a convenient tool for slicing boiled eggs evenly. It\'s perfect for salads, sandwiches, and other dishes where sliced eggs are desired.', 30),
(56, 0, 0, 'Electric Stove', 50, 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Electric%20Stove/thumbnail.png', 'kitchen appliances, cooktops', 'The Electric Stove provides a portable and efficient cooking solution. Ideal for small kitchens or as an additional cooking surface for various culinary needs.', 41),
(57, 0, 0, 'Fine Mesh Strainer', 10, 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Fine%20Mesh%20Strainer/thumbnail.png', 'kitchen tools, strainers', 'The Fine Mesh Strainer is a versatile tool for straining liquids and sifting dry ingredients. Its fine mesh ensures efficient filtering for smooth cooking and baking.', 13),
(58, 0, 0, 'Fork', 4, 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Fork/thumbnail.png', 'kitchen tools, utensils', 'The Fork is a classic utensil for various dining and serving purposes. Its durable and ergonomic design makes it a reliable choice for everyday use.', 10),
(59, 0, 0, 'Glass', 5, 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Glass/thumbnail.png', 'drinkware, glasses', 'The Glass is a versatile and elegant drinking vessel suitable for a variety of beverages. Its clear design allows you to enjoy the colors and textures of your drinks.', 68),
(60, 0, 0, 'Grater Black', 11, 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Grater%20Black/thumbnail.png', 'kitchen tools, graters', 'The Grater in Black is a handy kitchen tool for grating cheese, vegetables, and more. Its sleek design and sharp blades make food preparation efficient and easy.', 80),
(61, 0, 0, 'Hand Blender', 35, 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Hand%20Blender/thumbnail.png', 'kitchen appliances, blenders', 'The Hand Blender is a versatile kitchen appliance for blending, pureeing, and mixing. Its compact design and powerful motor make it a convenient tool for various recipes.', 8),
(62, 0, 0, 'Ice Cube Tray', 6, 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Ice%20Cube%20Tray/thumbnail.png', 'kitchen tools, ice cube trays', 'The Ice Cube Tray is a practical accessory for making ice cubes in various shapes. Perfect for keeping your drinks cool and adding a fun element to your beverages.', 81),
(63, 0, 0, 'Kitchen Sieve', 8, 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Kitchen%20Sieve/thumbnail.png', 'kitchen tools, strainers', 'The Kitchen Sieve is a versatile tool for sifting and straining dry and wet ingredients. Its fine mesh design ensures smooth results in your cooking and baking.', 33),
(64, 0, 0, 'Knife', 15, 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Knife/thumbnail.png', 'kitchen tools, cutlery', 'The Knife is an essential kitchen tool for chopping, slicing, and dicing. Its sharp blade and ergonomic handle make it a reliable choice for food preparation.', 59),
(65, 0, 0, 'Lunch Box', 13, 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Lunch%20Box/thumbnail.png', 'kitchen tools, storage', 'The Lunch Box is a convenient and portable container for packing and carrying your meals. With compartments for different foods, it\'s perfect for on-the-go dining.', 26),
(66, 0, 0, 'Microwave Oven', 90, 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Microwave%20Oven/thumbnail.png', 'kitchen appliances, microwaves', 'The Microwave Oven is a versatile kitchen appliance for quick and efficient cooking, reheating, and defrosting. Its compact size makes it suitable for various kitchen setups.', 27),
(67, 0, 0, 'Mug Tree Stand', 16, 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Mug%20Tree%20Stand/thumbnail.png', 'kitchen tools, organization', 'The Mug Tree Stand is a stylish and space-saving solution for organizing your mugs. Keep your favorite mugs easily accessible and neatly displayed in your kitchen.', 93),
(68, 0, 0, 'Pan', 25, 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Pan/thumbnail.png', 'cookware, pans', 'The Pan is a versatile and essential cookware item for frying, sautÃ©ing, and cooking various dishes. Its non-stick coating ensures easy food release and cleanup.', 40),
(69, 0, 0, 'Plate', 4, 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Plate/thumbnail.png', 'dinnerware, plates', 'The Plate is a classic and essential dishware item for serving meals. Its durable and stylish design makes it suitable for everyday use or special occasions.', 30),
(70, 0, 0, 'Red Tongs', 7, 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Red%20Tongs/thumbnail.png', 'kitchen tools, tongs', 'The Red Tongs are versatile kitchen tongs suitable for various cooking and serving tasks. Their vibrant color adds a pop of excitement to your kitchen utensils.', 15),
(71, 0, 0, 'Silver Pot With Glass Cap', 40, 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Silver%20Pot%20With%20Glass%20Cap/thumbnail.png', 'cookware, pots', 'The Silver Pot with Glass Cap is a stylish and functional cookware item for boiling, simmering, and preparing delicious meals. Its glass cap allows you to monitor cooking progress.', 37),
(72, 0, 0, 'Slotted Turner', 9, 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Slotted%20Turner/thumbnail.png', 'kitchen tools, turners', 'The Slotted Turner is a kitchen utensil designed for flipping and turning food items. Its slotted design allows excess liquid to drain, making it ideal for frying and sautÃ©ing.', 36),
(73, 0, 0, 'Spice Rack', 20, 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Spice%20Rack/thumbnail.png', 'kitchen tools, organization', 'The Spice Rack is a convenient organizer for your spices and seasonings. Keep your kitchen essentials within reach and neatly arranged with this stylish spice rack.', 24),
(74, 0, 0, 'Spoon', 5, 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Spoon/thumbnail.png', 'kitchen tools, utensils', 'The Spoon is a versatile kitchen utensil for stirring, serving, and tasting. Its ergonomic design and durable construction make it an essential tool for every kitchen.', 51),
(75, 0, 0, 'Tray', 17, 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Tray/thumbnail.png', 'serveware, trays', 'The Tray is a functional and decorative item for serving snacks, appetizers, or drinks. Its stylish design makes it a versatile accessory for entertaining guests.', 48),
(76, 0, 0, 'Wooden Rolling Pin', 12, 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Wooden%20Rolling%20Pin/thumbnail.png', 'kitchen tools, baking', 'The Wooden Rolling Pin is a classic kitchen tool for rolling out dough for baking. Its smooth surface and sturdy handles make it easy to achieve uniform thickness.', 80),
(77, 0, 0, 'Yellow Peeler', 6, 'https://cdn.dummyjson.com/products/images/kitchen-accessories/Yellow%20Peeler/thumbnail.png', 'kitchen tools, peelers', 'The Yellow Peeler is a handy tool for peeling fruits and vegetables with ease. Its bright yellow color adds a cheerful touch to your kitchen gadgets.', 86),
(78, 0, 0, 'Apple MacBook Pro 14 Inch Space Grey', 2000, 'https://cdn.dummyjson.com/products/images/laptops/Apple%20MacBook%20Pro%2014%20Inch%20Space%20Grey/thumbnail.png', 'laptops, apple', 'The MacBook Pro 14 Inch in Space Grey is a powerful and sleek laptop, featuring Apple\'s M1 Pro chip for exceptional performance and a stunning Retina display.', 39),
(79, 0, 0, 'Asus Zenbook Pro Dual Screen Laptop', 1800, 'https://cdn.dummyjson.com/products/images/laptops/Asus%20Zenbook%20Pro%20Dual%20Screen%20Laptop/thumbnail.png', 'laptops', 'The Asus Zenbook Pro Dual Screen Laptop is a high-performance device with dual screens, providing productivity and versatility for creative professionals.', 38),
(80, 0, 0, 'Huawei Matebook X Pro', 1400, 'https://cdn.dummyjson.com/products/images/laptops/Huawei%20Matebook%20X%20Pro/thumbnail.png', 'laptops', 'The Huawei Matebook X Pro is a slim and stylish laptop with a high-resolution touchscreen display, offering a premium experience for users on the go.', 34),
(81, 0, 0, 'Lenovo Yoga 920', 1100, 'https://cdn.dummyjson.com/products/images/laptops/Lenovo%20Yoga%20920/thumbnail.png', 'laptops', 'The Lenovo Yoga 920 is a 2-in-1 convertible laptop with a flexible hinge, allowing you to use it as a laptop or tablet, offering versatility and portability.', 71),
(82, 0, 0, 'New DELL XPS 13 9300 Laptop', 1500, 'https://cdn.dummyjson.com/products/images/laptops/New%20DELL%20XPS%2013%209300%20Laptop/thumbnail.png', 'laptops', 'The New DELL XPS 13 9300 Laptop is a compact and powerful device, featuring a virtually borderless InfinityEdge display and high-end performance for various tasks.', 18),
(83, 0, 0, 'Blue & Black Check Shirt', 30, 'https://cdn.dummyjson.com/products/images/mens-shirts/Blue%20&%20Black%20Check%20Shirt/thumbnail.png', 'clothing, men\'s shirts', 'The Blue & Black Check Shirt is a stylish and comfortable men\'s shirt featuring a classic check pattern. Made from high-quality fabric, it\'s suitable for both casual and semi-formal occasions.', 44),
(84, 0, 0, 'Gigabyte Aorus Men Tshirt', 25, 'https://cdn.dummyjson.com/products/images/mens-shirts/Gigabyte%20Aorus%20Men%20Tshirt/thumbnail.png', 'clothing, men\'s t-shirts', 'The Gigabyte Aorus Men Tshirt is a cool and casual shirt for gaming enthusiasts. With the Aorus logo and sleek design, it\'s perfect for expressing your gaming style.', 64),
(85, 0, 0, 'Man Plaid Shirt', 35, 'https://cdn.dummyjson.com/products/images/mens-shirts/Man%20Plaid%20Shirt/thumbnail.png', 'clothing, men\'s shirts', 'The Man Plaid Shirt is a timeless and versatile men\'s shirt with a classic plaid pattern. Its comfortable fit and casual style make it a wardrobe essential for various occasions.', 65),
(86, 0, 0, 'Man Short Sleeve Shirt', 20, 'https://cdn.dummyjson.com/products/images/mens-shirts/Man%20Short%20Sleeve%20Shirt/thumbnail.png', 'clothing, men\'s shirts', 'The Man Short Sleeve Shirt is a breezy and stylish option for warm days. With a comfortable fit and short sleeves, it\'s perfect for a laid-back yet polished look.', 20),
(87, 0, 0, 'Men Check Shirt', 28, 'https://cdn.dummyjson.com/products/images/mens-shirts/Men%20Check%20Shirt/thumbnail.png', 'clothing, men\'s shirts', 'The Men Check Shirt is a classic and versatile shirt featuring a stylish check pattern. Suitable for various occasions, it adds a smart and polished touch to your wardrobe.', 69),
(88, 0, 0, 'Nike Air Jordan 1 Red And Black', 150, 'https://cdn.dummyjson.com/products/images/mens-shoes/Nike%20Air%20Jordan%201%20Red%20And%20Black/thumbnail.png', 'footwear, athletic shoes', 'The Nike Air Jordan 1 in Red and Black is an iconic basketball sneaker known for its stylish design and high-performance features, making it a favorite among sneaker enthusiasts and athletes.', 15),
(89, 0, 0, 'Nike Baseball Cleats', 80, 'https://cdn.dummyjson.com/products/images/mens-shoes/Nike%20Baseball%20Cleats/thumbnail.png', 'footwear, sports cleats', 'Nike Baseball Cleats are designed for maximum traction and performance on the baseball field. They provide stability and support for players during games and practices.', 14),
(90, 0, 0, 'Puma Future Rider Trainers', 90, 'https://cdn.dummyjson.com/products/images/mens-shoes/Puma%20Future%20Rider%20Trainers/thumbnail.png', 'footwear, casual shoes', 'The Puma Future Rider Trainers offer a blend of retro style and modern comfort. Perfect for casual wear, these trainers provide a fashionable and comfortable option for everyday use.', 10),
(91, 0, 0, 'Sports Sneakers Off White & Red', 120, 'https://cdn.dummyjson.com/products/images/mens-shoes/Sports%20Sneakers%20Off%20White%20&%20Red/thumbnail.png', 'footwear, athletic shoes', 'The Sports Sneakers in Off White and Red combine style and functionality, making them a fashionable choice for sports enthusiasts. The red and off-white color combination adds a bold and energetic touch.', 73),
(92, 0, 0, 'Sports Sneakers Off White Red', 110, 'https://cdn.dummyjson.com/products/images/mens-shoes/Sports%20Sneakers%20Off%20White%20Red/thumbnail.png', 'footwear, casual shoes', 'Another variant of the Sports Sneakers in Off White Red, featuring a unique design. These sneakers offer style and comfort for casual occasions.', 75),
(93, 0, 0, 'Brown Leather Belt Watch', 90, 'https://cdn.dummyjson.com/products/images/mens-watches/Brown%20Leather%20Belt%20Watch/thumbnail.png', 'watches, leather watches', 'The Brown Leather Belt Watch is a stylish timepiece with a classic design. Featuring a genuine leather strap and a sleek dial, it adds a touch of sophistication to your look.', 69),
(94, 0, 0, 'Longines Master Collection', 1500, 'https://cdn.dummyjson.com/products/images/mens-watches/Longines%20Master%20Collection/thumbnail.png', 'watches, luxury watches', 'The Longines Master Collection is an elegant and refined watch known for its precision and craftsmanship. With a timeless design, it\'s a symbol of luxury and sophistication.', 65),
(95, 0, 0, 'Rolex Cellini Date Black Dial', 9000, 'https://cdn.dummyjson.com/products/images/mens-watches/Rolex%20Cellini%20Date%20Black%20Dial/thumbnail.png', 'watches, luxury watches', 'The Rolex Cellini Date with Black Dial is a classic and prestigious watch. With a black dial and date complication, it exudes sophistication and is a symbol of Rolex\'s heritage.', 84),
(96, 0, 0, 'Rolex Cellini Moonphase', 13000, 'https://cdn.dummyjson.com/products/images/mens-watches/Rolex%20Cellini%20Moonphase/thumbnail.png', 'watches, luxury watches', 'The Rolex Cellini Moonphase is a masterpiece of horology, featuring a moon phase complication and exquisite design. It reflects Rolex\'s commitment to precision and elegance.', 33),
(97, 0, 0, 'Rolex Datejust', 11000, 'https://cdn.dummyjson.com/products/images/mens-watches/Rolex%20Datejust/thumbnail.png', 'watches, luxury watches', 'The Rolex Datejust is an iconic and versatile timepiece with a date window. Known for its timeless design and reliability, it\'s a symbol of Rolex\'s watchmaking excellence.', 11),
(98, 0, 0, 'Rolex Submariner Watch', 14000, 'https://cdn.dummyjson.com/products/images/mens-watches/Rolex%20Submariner%20Watch/thumbnail.png', 'watches, luxury watches', 'The Rolex Submariner is a legendary dive watch with a rich history. Known for its durability and water resistance, it\'s a symbol of adventure and exploration.', 35),
(99, 0, 0, 'Amazon Echo Plus', 100, 'https://cdn.dummyjson.com/products/images/mobile-accessories/Amazon%20Echo%20Plus/thumbnail.png', 'electronics, smart speakers', 'The Amazon Echo Plus is a smart speaker with built-in Alexa voice control. It features premium sound quality and serves as a hub for controlling smart home devices.', 50),
(100, 0, 0, 'Apple Airpods', 130, 'https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20Airpods/thumbnail.png', 'electronics, wireless earphones', 'The Apple Airpods offer a seamless wireless audio experience. With easy pairing, high-quality sound, and Siri integration, they are perfect for on-the-go listening.', 93);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', 'puneeth', '9448121558', '123456789', 'sdcjns,djc'),
(15, 'hemu', 'ajhgdg', 'puneethreddy951@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu');

--
-- Disparadores `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', '123456789', '9448121558', '123456789', 'sdcjns,djc'),
(14, 'hemanthu', 'reddy', 'hemanthreddy951@gmail.com', '123456788', '6526436723', 's,dc wfjvnvn', 'b efhfhvvbr'),
(15, 'hemu', 'ajhgdg', 'keeru@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(20, 'pramod', 'vh', 'pramod@gmail.com', '124335353', '9767645653', 'ksbdfcdf', 'sjrgrevgsib'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indices de la tabla `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indices de la tabla `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indices de la tabla `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indices de la tabla `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indices de la tabla `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
