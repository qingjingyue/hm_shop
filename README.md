# HM Shop

一个基于Flutter开发的现代化电商应用，提供完整的购物体验，包括商品浏览、分类筛选、购物车管理和个人中心等功能。

![Flutter](https://img.shields.io/badge/Flutter-3.10.8+-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.10.8+-0175C2?logo=dart)
![Platform](https://img.shields.io/badge/platform-iOS%20%7C%20Android%20%7C%20Web%20%7C%20Desktop-lightgrey)

## 目录

- [项目概述](#项目概述)
- [功能特点](#功能特点)
- [技术架构](#技术架构)
- [环境要求](#环境要求)
- [安装步骤](#安装步骤)
- [使用说明](#使用说明)
- [开发指南](#开发指南)
- [项目结构](#项目结构)
- [贡献规范](#贡献规范)
- [许可证信息](#许可证信息)
- [联系方式](#联系方式)

## 项目概述

HM Shop 是一个功能完善的跨平台电商应用，采用Flutter框架开发，支持iOS、Android、Web及桌面端。项目采用现代化的架构设计，实现了完整的电商业务流程，为用户提供流畅的购物体验。

### 主要特性

- 📱 **跨平台支持**: 一套代码，多端运行
- 🎨 **精美UI设计**: 遵循Material Design设计规范
- ⚡ **高性能**: 基于Flutter的高性能渲染引擎
- 🔐 **安全认证**: 完善的用户认证和授权机制
- 🛒 **完整购物流程**: 浏览、加购、结算一体化

## 功能特点

### 核心功能

- **首页**: 轮播图展示、热门商品推荐、新品上架、分类导航
- **分类**: 商品分类浏览、多级分类筛选
- **购物车**: 商品管理、数量调整、价格计算
- **我的**: 个人信息管理、订单查询、收藏夹、浏览历史、会员中心

### 技术亮点

- **状态管理**: 使用GetX进行高效的状态管理
- **网络请求**: 基于Dio的二次封装，支持拦截器和统一错误处理
- **本地存储**: 使用SharedPreferences持久化用户数据
- **路由管理**: 统一的路由配置和导航管理
- **组件化开发**: 高度模块化的组件设计，便于复用和维护

## 技术架构

### 技术栈

| 技术               | 版本    | 说明       |
| ------------------ | ------- | ---------- |
| Flutter            | 3.10.8+ | UI框架     |
| Dart               | 3.10.8+ | 编程语言   |
| GetX               | 4.7.3   | 状态管理   |
| Dio                | 5.9.1   | 网络请求   |
| carousel_slider    | 5.1.2   | 轮播图组件 |
| shared_preferences | 2.5.4   | 本地存储   |

### 架构设计

```
┌─────────────────────────────────────────┐
│           Presentation Layer            │
│  (Pages, Components, Widgets)           │
├─────────────────────────────────────────┤
│           Business Layer                │
│  (Controllers, API Services)             │
├─────────────────────────────────────────┤
│           Data Layer                    │
│  (API, Local Storage, Utils)            │
├─────────────────────────────────────────┤
│           Core Layer                    │
│  (Constants, Types, Routes)             │
└─────────────────────────────────────────┘
```

## 环境要求

### 开发环境

- **Flutter SDK**: 3.10.8 或更高版本
- **Dart SDK**: 3.10.8 或更高版本
- **IDE**: Android Studio / VS Code / IntelliJ IDEA
- **Git**: 用于版本控制

### 平台要求

| 平台    | 最低版本                         | 说明                          |
| ------- | -------------------------------- | ----------------------------- |
| Android | API 21+                          | Android 5.0+                  |
| iOS     | 12.0+                            | 需要 Xcode 14.0+              |
| Web     | 现代浏览器                       | Chrome, Firefox, Safari, Edge |
| Desktop | Windows 10+, macOS 10.14+, Linux | 根据平台而定                  |

## 安装步骤

### 1. 克隆项目

```bash
git clone https://github.com/yourusername/hm_shop.git
cd hm_shop
```

### 2. 安装依赖

```bash
flutter pub get
```

### 3. 配置环境

在 `lib/constants/index.dart` 中配置API基础URL等常量：

```dart
class GlobalConstants {
  static const String BASE_URL = 'https://api.example.com';
  static const int TIME_OUT = 30;
  static const int SUCCESS_CODE = 200;
}
```

### 4. 运行项目

```bash
# 运行在模拟器或连接的设备
flutter run

# 指定平台运行
flutter run -d chrome        # Web
flutter run -d macos         # macOS
flutter run -d windows       # Windows
```

### 5. 构建发布版本

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS
flutter build ios --release

# Web
flutter build web --release

# macOS
flutter build macos --release

# Windows
flutter build windows --release
```

## 使用说明

### 首次使用

1. 启动应用后，会自动跳转到首页
2. 首页展示轮播图、热门商品、新品推荐等内容
3. 点击底部导航栏可切换不同页面

### 主要功能使用

#### 商品浏览

- 在首页查看推荐商品
- 在分类页按类别浏览商品
- 点击商品查看详情

#### 购物车操作

- 将商品添加到购物车
- 在购物车中调整商品数量
- 进行结算操作

#### 个人中心

- 查看个人信息
- 管理订单状态
- 查看收藏和历史记录

## 开发指南

### 代码规范

项目遵循Flutter官方代码规范，建议使用以下工具：

```bash
# 代码格式化
flutter format .

# 代码分析
flutter analyze

# 运行测试
flutter test
```

### 添加新页面

1. 在 `lib/pages/` 下创建新页面目录
2. 创建页面组件文件
3. 在 `lib/routes/index.dart` 中注册路由

示例：

```dart
// lib/pages/product/detail.dart
class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('商品详情')),
      body: Container(),
    );
  }
}

// lib/routes/index.dart
Map<String, Widget Function(BuildContext)> getRootRoutes() {
  return {
    '/': (context) => const MainPage(),
    '/login': (context) => const LoginPage(),
    '/product/detail': (context) => const ProductDetailPage(),
  };
}
```

### 添加API接口

1. 在 `lib/api/` 下创建API文件
2. 使用 `dioRequest` 发起请求

示例：

```dart
// lib/api/product.dart
import 'package:hm_shop/utils/DioRequest.dart';

Future<List<dynamic>> getProductList() async {
  return await dioRequest.get('/products');
}

Future<dynamic> getProductDetail(int id) async {
  return await dioRequest.get('/products/$id');
}
```

### 状态管理

使用GetX进行状态管理：

```dart
// lib/stores/ProductController.dart
import 'package:get/get.dart';

class ProductController extends GetxController {
  final RxList<dynamic> products = <dynamic>[].obs;
  final RxBool isLoading = false.obs;

  Future<void> fetchProducts() async {
    isLoading.value = true;
    try {
      final data = await getProductList();
      products.value = data;
    } catch (e) {
      // 错误处理
    } finally {
      isLoading.value = false;
    }
  }
}

// 使用
final controller = Get.put(ProductController());
Obx(() => controller.isLoading.value
    ? CircularProgressIndicator()
    : ListView.builder(...))
```

## 项目结构

```
lib/
├── api/                    # API接口层
│   ├── home.dart          # 首页相关API
│   ├── mine.dart          # 个人中心API
│   └── user.dart          # 用户API
├── assets/                # 静态资源
│   ├── images/            # 图片资源
│   └── icons/             # 图标资源
├── components/            # 可复用组件
│   ├── home/              # 首页组件
│   │   ├── HmCategory.dart
│   │   ├── HmHot.dart
│   │   ├── HmMoreList.dart
│   │   ├── HmSlider.dart
│   │   └── HmSuggestion.dart
│   └── mine/              # 个人中心组件
│       └── HmGuess.dart
├── constants/             # 常量定义
│   └── index.dart
├── pages/                 # 页面
│   ├── cart/              # 购物车页
│   ├── category/          # 分类页
│   ├── home/              # 首页
│   ├── login/             # 登录页
│   ├── main/              # 主页（底部导航）
│   └── mine/              # 个人中心
├── routes/                # 路由配置
│   └── index.dart
├── stores/                # 状态管理
│   ├── TokenManager.dart  # Token管理
│   └── UserController.dart # 用户状态
├── types/                 # 类型定义
│   ├── home.dart
│   └── user.dart
├── utils/                 # 工具类
│   ├── DioRequest.dart    # 网络请求封装
│   ├── LoadingDialog.dart # 加载对话框
│   └── ToastUtils.dart    # 提示工具
└── main.dart              # 应用入口
```

## 贡献规范

我们欢迎任何形式的贡献！如果您想为项目做出贡献，请遵循以下步骤：

### 贡献流程

1. **Fork项目**: 点击页面右上角的Fork按钮
2. **创建分支**: 为您的功能或修复创建一个新分支
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **提交更改**: 提交您的更改
   ```bash
   git commit -m 'Add some feature'
   ```
4. **推送分支**: 将分支推送到远程仓库
   ```bash
   git push origin feature/your-feature-name
   ```
5. **提交Pull Request**: 在GitHub上创建Pull Request

### 提交规范

请遵循以下提交信息格式：

```
<type>(<scope>): <subject>

<body>

<footer>
```

Type类型：

- `feat`: 新功能
- `fix`: 修复bug
- `docs`: 文档更新
- `style`: 代码格式调整
- `refactor`: 重构
- `test`: 测试相关
- `chore`: 构建/工具相关

示例：

```
feat(home): add product carousel slider

- Add carousel_slider dependency
- Implement HmSlider component
- Add auto-play functionality

Closes #123
```

### 代码审查

所有Pull Request都需要经过代码审查，确保：

- 代码符合项目规范
- 包含必要的测试
- 文档已更新（如需要）
- 没有引入新的问题

## 许可证信息

本项目采用 [MIT License](LICENSE) 开源许可证。

```
MIT License

Copyright (c) 2025 HM Shop

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## 联系方式

如有任何问题或建议，欢迎通过以下方式联系我们：

- **项目地址**: [https://github.com/yourusername/hm_shop](https://github.com/yourusername/hm_shop)
- **问题反馈**: [GitHub Issues](https://github.com/yourusername/hm_shop/issues)
- **邮箱**: your.email@example.com

## 致谢

感谢所有为这个项目做出贡献的开发者！

## 相关资源

- [Flutter官方文档](https://flutter.dev/docs)
- [Dart语言指南](https://dart.dev/guides)
- [GetX文档](https://github.com/jonataslaw/getx)
- [Dio文档](https://github.com/cfug/dio)

---

**注意**: 本项目仅供学习和参考使用，请勿用于商业用途。
