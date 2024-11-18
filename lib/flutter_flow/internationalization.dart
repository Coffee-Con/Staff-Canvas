import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'zh_Hans', 'ja'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? zh_HansText = '',
    String? jaText = '',
  }) =>
      [enText, zh_HansText, jaText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Login
  {
    'yuaaz2pl': {
      'en': 'Staff Canvas',
      'ja': 'スタッフキャンバス',
      'zh_Hans': '员工画布',
    },
    'nfg7dwt5': {
      'en': 'Welcome Back',
      'ja': 'おかえり',
      'zh_Hans': '欢迎回来',
    },
    'm51db4t6': {
      'en': 'Let\'s get started by filling out the form below.',
      'ja': 'まずは以下のフォームに記入しましょう。',
      'zh_Hans': '让我们从填写下面的表格开始。',
    },
    'fjlclrv4': {
      'en': 'Email',
      'ja': 'メール',
      'zh_Hans': '电子邮件',
    },
    'bhquldyc': {
      'en': 'Password',
      'ja': 'パスワード',
      'zh_Hans': '密码',
    },
    'v64c5x7u': {
      'en': 'Sign In',
      'ja': 'サインイン',
      'zh_Hans': '登入',
    },
    'r3xnjgs7': {
      'en': 'Forget your password?',
      'ja': 'パスワードを忘れましたか?',
      'zh_Hans': '忘记密码？',
    },
    'vb9xqhu0': {
      'en': 'Change password here',
      'ja': 'ここでパスワードを変更',
      'zh_Hans': '在此更改密码',
    },
    'zctg4r1g': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // ForgotPassword
  {
    't8s3i4la': {
      'en': 'Back',
      'ja': '戻る',
      'zh_Hans': '后退',
    },
    '4yf2upmf': {
      'en': 'Forgot/Change Password',
      'ja': 'パスワードをお忘れですか',
      'zh_Hans': '忘记密码',
    },
    'i6c9xa8x': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'ja':
          'パスワードをリセットするためのリンクが記載されたメールをお送りしますので、アカウントに関連付けられているメールアドレスを以下に入力してください。',
      'zh_Hans': '我们将向您发送一封包含重置密码链接的电子邮件，请在下面输入与您的帐户关联的电子邮件。',
    },
    'q6eyf17e': {
      'en': 'Your email address...',
      'ja': 'あなたのメールアドレス...',
      'zh_Hans': '您的电子邮件地址...',
    },
    'nekk7j8o': {
      'en': 'Enter your email...',
      'ja': 'メールアドレスを入力してください...',
      'zh_Hans': '输入您的电子邮件...',
    },
    'z0zw6s5s': {
      'en': 'Send Link',
      'ja': 'リンクを送信',
      'zh_Hans': '发送链接',
    },
    '35yl6joj': {
      'en': 'Back',
      'ja': '戻る',
      'zh_Hans': '后退',
    },
    'x33s51cr': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // home
  {
    '0fn24fi0': {
      'en': 'Below is a summary of your activity.',
      'ja': '以下はあなたのアクティビティの概要です。',
      'zh_Hans': '以下是您的活动的摘要。',
    },
    'uri2uo8q': {
      'en': 'New Learn',
      'ja': '新しい学習',
      'zh_Hans': '新学习',
    },
    '1qpq8g6i': {
      'en': '2',
      'ja': '2',
      'zh_Hans': '2',
    },
    '7t0h60z9': {
      'en': 'New Modules',
      'ja': '新しいモジュール',
      'zh_Hans': '新模块',
    },
    '3ob0h4a9': {
      'en': '1',
      'ja': '1',
      'zh_Hans': '1',
    },
    '9mc36o2j': {
      'en': 'Projects',
      'ja': 'プロジェクト',
      'zh_Hans': '项目',
    },
    'ypium64t': {
      'en': 'Dashboard',
      'ja': 'ダッシュボード',
      'zh_Hans': '仪表板',
    },
    '38zoe46c': {
      'en': '__',
      'ja': '__',
      'zh_Hans': '__',
    },
  },
  // Course
  {
    'o7pfgeb8': {
      'en': 'Modules',
      'ja': 'モジュール',
      'zh_Hans': '模块',
    },
    'vl77bcbk': {
      'en': 'Course Materials',
      'ja': 'コース教材',
      'zh_Hans': '课程材料',
    },
    '7nm1v1xn': {
      'en': 'Assessment',
      'ja': '評価',
      'zh_Hans': '评估',
    },
    'zs9pdttj': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // SendSuccess
  {
    'jzjkphrx': {
      'en': 'Back',
      'ja': '戻る',
      'zh_Hans': '后退',
    },
    '04bf39i3': {
      'en': 'Send Success',
      'ja': '送信成功',
      'zh_Hans': '发送成功',
    },
    'g3amsaww': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'ja':
          'パスワードをリセットするためのリンクが記載されたメールをお送りしますので、アカウントに関連付けられているメールアドレスを以下に入力してください。',
      'zh_Hans': '我们将向您发送一封包含重置密码链接的电子邮件，请在下面输入与您的帐户关联的电子邮件。',
    },
    'pifsuuey': {
      'en': 'Back',
      'ja': '戻る',
      'zh_Hans': '后退',
    },
    '5lv4sita': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // Assignments
  {
    'iqlon7a1': {
      'en': 'Assignments',
      'ja': '課題',
      'zh_Hans': '作业',
    },
    'e610q9yi': {
      'en': 'ToDo',
      'ja': 'やること',
      'zh_Hans': '待办事项',
    },
    'ktb5pm79': {
      'en': 'In Progress',
      'ja': '進行中',
      'zh_Hans': '进行中',
    },
    'm6z5xy1b': {
      'en': 'Completed',
      'ja': '完了',
      'zh_Hans': '完全的',
    },
    '0xye6b2g': {
      'en': 'Complete',
      'ja': '完了',
      'zh_Hans': '完全的',
    },
    'sghxw7c8': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // Materials
  {
    'h6wcrd8z': {
      'en': 'Week 1 - ',
      'ja': '第1週 -',
      'zh_Hans': '第一周 -',
    },
    'ftefzsno': {
      'en': 'Weekly task',
      'ja': '毎週のタスク',
      'zh_Hans': '每周任务',
    },
    'l8qzbrgt': {
      'en': 'After',
      'ja': '後',
      'zh_Hans': '后',
    },
    'mrl9h6b5': {
      'en': 'Tuesday, 10:00pm',
      'ja': '火曜日、午後10時',
      'zh_Hans': '星期二晚上 10:00',
    },
    'cnp4cdvt': {
      'en': 'Read',
      'ja': '読む',
      'zh_Hans': '读',
    },
    'zyu7eypw': {
      'en': 'Week 2 - ',
      'ja': '第2週 -',
      'zh_Hans': '第 2 周 -',
    },
    'wssvedly': {
      'en': 'To learn something.',
      'ja': '何かを学ぶため。',
      'zh_Hans': '学习一些东西。',
    },
    'cw372q4v': {
      'en': 'After',
      'ja': '後',
      'zh_Hans': '后',
    },
    'gb4d9wy5': {
      'en': 'Tuesday, 11:00pm',
      'ja': '火曜日、午後11時',
      'zh_Hans': '星期二晚上 11:00',
    },
    'j54y6rai': {
      'en': 'Read',
      'ja': '読む',
      'zh_Hans': '读',
    },
    '0xibjqjp': {
      'en': 'Course Materials',
      'ja': 'コース教材',
      'zh_Hans': '课程材料',
    },
    '4cz3i7yn': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // Overview
  {
    'uae2xcf1': {
      'en': 'Introduction',
      'ja': '導入',
      'zh_Hans': '介绍',
    },
    'ayq9cw2k': {
      'en': 'aaaaa',
      'ja': 'ああああ',
      'zh_Hans': '啊啊啊啊',
    },
    'vfaaon7s': {
      'en': 'Read',
      'ja': '読む',
      'zh_Hans': '读',
    },
    'p73u73vn': {
      'en': 'Course Outline',
      'ja': 'コース概要',
      'zh_Hans': '课程大纲',
    },
    'maeuqghs': {
      'en': 'bbbbbb',
      'ja': 'bbbbbb',
      'zh_Hans': 'bbbbbb',
    },
    'owsqf6v5': {
      'en': 'Read',
      'ja': '読む',
      'zh_Hans': '读',
    },
    '2n094hh7': {
      'en': 'Course Overview',
      'ja': 'コース概要',
      'zh_Hans': '课程概述',
    },
    'gvf6wkj3': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // YouTubePDF
  {
    'uuosxsx6': {
      'en': 'YouTube & PDF Demo',
      'ja': 'YouTube & PDFデモ',
      'zh_Hans': 'YouTube 和 PDF 演示',
    },
    '6tr5c37z': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // profile
  {
    'wf1uchoh': {
      'en': 'Change Password',
      'ja': 'パスワードを変更する',
      'zh_Hans': '更改密码',
    },
    'xqyoqs6v': {
      'en': 'Terms of Services',
      'ja': '利用規約',
      'zh_Hans': '服务条款',
    },
    'vs3lx1im': {
      'en': 'Log Out',
      'ja': 'ログアウト',
      'zh_Hans': '登出',
    },
  },
  // QuizScore
  {
    'k6panmsv': {
      'en': 'More Random Description',
      'ja': 'ランダムな説明',
      'zh_Hans': '更多随机描述',
    },
    'sl1mjo58': {
      'en': 'Back',
      'ja': '戻る',
      'zh_Hans': '后退',
    },
    '0y1qkncr': {
      'en': 'Daily Quiz',
      'ja': 'デイリークイズ',
      'zh_Hans': '每日测验',
    },
    'l5igh36i': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // Quiz
  {
    'douf1we5': {
      'en': 'Submit',
      'ja': '提出する',
      'zh_Hans': '提交',
    },
    'smdrmxwi': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // Rewards
  {
    '28t3ohnx': {
      'en': 'Rewards',
      'ja': '',
      'zh_Hans': '',
    },
    '94jeuy7y': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // RewardConfirm
  {
    'aise1lt5': {
      'en': 'Recipient',
      'ja': '',
      'zh_Hans': '',
    },
    'oywb2jhn': {
      'en': 'Reward ID',
      'ja': '',
      'zh_Hans': '',
    },
    'wjatl4uj': {
      'en': 'Date',
      'ja': '',
      'zh_Hans': '',
    },
    'xxc5nhbx': {
      'en': 'Amount',
      'ja': '',
      'zh_Hans': '',
    },
    'e893ghis': {
      'en': 'Payment Method',
      'ja': '',
      'zh_Hans': '',
    },
    '7tiwjif4': {
      'en': 'Point',
      'ja': '',
      'zh_Hans': '',
    },
    '9o8e3xe8': {
      'en': 'Transaction Breakdown',
      'ja': '',
      'zh_Hans': '',
    },
    '0dyxbak0': {
      'en': 'Total',
      'ja': '',
      'zh_Hans': '',
    },
    'xmuu82e2': {
      'en': 'Confirm',
      'ja': '',
      'zh_Hans': '',
    },
    'xk9t9kp0': {
      'en': 'RewardConfirm',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // Terms
  {
    '57c9f972': {
      'en': 'Terms of Service',
      'ja': '',
      'zh_Hans': '',
    },
    'rjja5dw3': {
      'en': 'Last Updated: June 15, 2023',
      'ja': '',
      'zh_Hans': '',
    },
    'u6lrmlop': {
      'en': '1. Acceptance of Terms',
      'ja': '',
      'zh_Hans': '',
    },
    'e9om8vre': {
      'en':
          'By accessing and using this application, you acknowledge that you have read, understood, and agree to be bound by these Terms of Service.',
      'ja': '',
      'zh_Hans': '',
    },
    'fjbfn2z0': {
      'en': '2. User Accounts',
      'ja': '',
      'zh_Hans': '',
    },
    'dh0ey1at': {
      'en':
          'You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account. You must immediately notify us of any unauthorized use of your account.',
      'ja': '',
      'zh_Hans': '',
    },
    '75gna8at': {
      'en': '3. Privacy Policy',
      'ja': '',
      'zh_Hans': '',
    },
    'ekhjpan2': {
      'en':
          'Your use of the application is also governed by our Privacy Policy, which is incorporated into these Terms by reference.',
      'ja': '',
      'zh_Hans': '',
    },
    '51g6fqh0': {
      'en': '4. Content Guidelines',
      'ja': '',
      'zh_Hans': '',
    },
    'sb344zni': {
      'en':
          'Users must not post, upload, or share any content that is illegal, harmful, threatening, abusive, harassing, defamatory, or otherwise objectionable.',
      'ja': '',
      'zh_Hans': '',
    },
    'kx99mvz5': {
      'en': '5. Intellectual Property',
      'ja': '',
      'zh_Hans': '',
    },
    'mj536o8e': {
      'en':
          'All content and materials available in the application, including but not limited to text, graphics, logos, and software, are the property of the company or its licensors.',
      'ja': '',
      'zh_Hans': '',
    },
    'i2b32kxd': {
      'en': '6. Termination',
      'ja': '',
      'zh_Hans': '',
    },
    'z1msth77': {
      'en':
          'We reserve the right to terminate or suspend your account and access to the application at our sole discretion, without notice, for conduct that we believe violates these Terms or is harmful to other users.',
      'ja': '',
      'zh_Hans': '',
    },
    'lhv3d4s3': {
      'en': '7. Changes to Terms',
      'ja': '',
      'zh_Hans': '',
    },
    'srha8lhh': {
      'en':
          'We reserve the right to modify these Terms at any time. We will notify users of any material changes by posting the new Terms on the application.',
      'ja': '',
      'zh_Hans': '',
    },
    '7n5zemap': {
      'en': 'Contact Us',
      'ja': '',
      'zh_Hans': '',
    },
    'p9mcm4w1': {
      'en':
          'If you have any questions about these Terms, please contact us at support@example.com',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // SideNav
  {
    'wugegxc2': {
      'en': 'Platform Navigation',
      'ja': 'プラットフォームナビゲーション',
      'zh_Hans': '平台导航',
    },
    'gz12a041': {
      'en': 'Home',
      'ja': 'ダッシュボード',
      'zh_Hans': '仪表板',
    },
    '9onzbacz': {
      'en': 'Reward',
      'ja': '褒美',
      'zh_Hans': '报酬',
    },
    'n9adzvdc': {
      'en': 'Report',
      'ja': '褒美',
      'zh_Hans': '报酬',
    },
    'lgiytwji': {
      'en': 'Settings',
      'ja': '設定',
      'zh_Hans': '设置',
    },
    'wx3uelbn': {
      'en': 'Profile',
      'ja': 'プロフィール',
      'zh_Hans': '轮廓',
    },
    '0p3wet4h': {
      'en': 'Log out',
      'ja': 'ログアウト',
      'zh_Hans': '登出',
    },
  },
  // Question
  {
    'oi58jkdn': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'toerf750': {
      'en': 'B',
      'ja': 'B',
      'zh_Hans': '乙',
    },
    '13u7unx9': {
      'en': 'C',
      'ja': 'Ｃ',
      'zh_Hans': '碳',
    },
    '15u3r026': {
      'en': 'D',
      'ja': 'だ',
      'zh_Hans': '德',
    },
    'nh59tks5': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'z6kbff3s': {
      'en': 'Your Answer',
      'ja': 'あなたのメールアドレス...',
      'zh_Hans': '您的电子邮件地址...',
    },
    '0u35dval': {
      'en': 'Enter your answer...',
      'ja': 'メールアドレスを入力してください...',
      'zh_Hans': '输入您的电子邮件...',
    },
  },
  // QuestionCopy
  {
    '3j2bs1rh': {
      'en': 'Your Answer',
      'ja': 'あなたのメールアドレス...',
      'zh_Hans': '您的电子邮件地址...',
    },
    '91mhqgpk': {
      'en': 'Enter your answer...',
      'ja': 'メールアドレスを入力してください...',
      'zh_Hans': '输入您的电子邮件...',
    },
  },
  // Miscellaneous
  {
    'hsxk7jxg': {
      'en': 'Notification',
      'ja': '通知',
      'zh_Hans': '通知',
    },
    '2q672i5u': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'pdq0gm97': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '5gt6qy2e': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '395rai5f': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'dohlaxbt': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'uq479ikv': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'gzwkml1c': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '1wmxiyma': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'djhwqsgg': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'patu0btb': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'p8q518pa': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'j8zi24lt': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'hif9x3gx': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'aniokts9': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'flcmhh7f': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'xuhsb8zj': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'o3k6qdni': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '22fjoqvt': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '5hytm0jo': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'xmjqqnbp': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'x8g9r3ih': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '14jqdq1h': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'g6c5v9cs': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'nkopdohb': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'p0yhyl9i': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
].reduce((a, b) => a..addAll(b));
