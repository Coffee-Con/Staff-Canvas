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
      'ja': 'パスワードを忘れた/変更する',
      'zh_Hans': '忘记/修改密码',
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
    'cnp4cdvt': {
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
  // CourseMaterial
  {
    'uuosxsx6': {
      'en': 'Course Material',
      'ja': 'コース教材',
      'zh_Hans': '课程材料',
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
    'sl1mjo58': {
      'en': 'Back',
      'ja': '戻る',
      'zh_Hans': '后退',
    },
    '0y1qkncr': {
      'en': 'Quiz Score',
      'ja': 'クイズスコア',
      'zh_Hans': '测验分数',
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
      'ja': '報酬',
      'zh_Hans': '奖励',
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
      'ja': '受取人',
      'zh_Hans': '接受者',
    },
    'oywb2jhn': {
      'en': 'Reward ID',
      'ja': '報酬ID',
      'zh_Hans': '獎勵ID',
    },
    'wjatl4uj': {
      'en': 'Date',
      'ja': '日付',
      'zh_Hans': '日期',
    },
    'xxc5nhbx': {
      'en': 'Amount',
      'ja': '額',
      'zh_Hans': '数量',
    },
    'e893ghis': {
      'en': 'Payment Method',
      'ja': '支払方法',
      'zh_Hans': '付款方式',
    },
    '7tiwjif4': {
      'en': 'Point',
      'ja': 'ポイント',
      'zh_Hans': '观点',
    },
    '9o8e3xe8': {
      'en': 'Transaction Breakdown',
      'ja': '取引の内訳',
      'zh_Hans': '交易明细',
    },
    '0dyxbak0': {
      'en': 'Total',
      'ja': '合計',
      'zh_Hans': '全部的',
    },
    'xmuu82e2': {
      'en': 'Confirm',
      'ja': '確認する',
      'zh_Hans': '确认',
    },
    'xk9t9kp0': {
      'en': 'RewardConfirm',
      'ja': '報酬確認',
      'zh_Hans': '獎勵確認',
    },
  },
  // Terms
  {
    '57c9f972': {
      'en': 'Terms of Service',
      'ja': '利用規約',
      'zh_Hans': '服务条款',
    },
    'rjja5dw3': {
      'en': 'Last Updated: June 15, 2023',
      'ja': '最終更新日: 2023年6月15日',
      'zh_Hans': '最后更新：2023 年 6 月 15 日',
    },
    'u6lrmlop': {
      'en': '1. Acceptance of Terms',
      'ja': '1. 規約の承諾',
      'zh_Hans': '1. 接受条款',
    },
    'e9om8vre': {
      'en':
          'By accessing and using this application, you acknowledge that you have read, understood, and agree to be bound by these Terms of Service.',
      'ja':
          'このアプリケーションにアクセスし、使用することにより、お客様は本利用規約を読み、理解し、これに拘束されることに同意したことを認めます。',
      'zh_Hans': '通过访问和使用此应用程序，您承认您已阅读、理解并同意受这些服务条款的约束。',
    },
    'fjbfn2z0': {
      'en': '2. User Accounts',
      'ja': '2. ユーザーアカウント',
      'zh_Hans': '2. 用户帐户',
    },
    'dh0ey1at': {
      'en':
          'You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account. You must immediately notify us of any unauthorized use of your account.',
      'ja':
          'お客様は、アカウント認証情報の機密性を維持し、お客様のアカウントで発生するすべての活動について責任を負います。アカウントの不正使用があった場合は、直ちに当社に通知する必要があります。',
      'zh_Hans': '您有责任维护您的帐户凭据的机密性以及您帐户下发生的所有活动。如果您的帐户有任何未经授权的使用，您必须立即通知我们。',
    },
    '75gna8at': {
      'en': '3. Privacy Policy',
      'ja': '3. プライバシーポリシー',
      'zh_Hans': '3. 隐私政策',
    },
    'ekhjpan2': {
      'en':
          'Your use of the application is also governed by our Privacy Policy, which is incorporated into these Terms by reference.',
      'ja': 'アプリケーションの使用は、参照により本規約に組み込まれている当社のプライバシー ポリシーにも準拠します。',
      'zh_Hans': '您对该应用程序的使用也受我们的隐私政策的约束，该政策通过引用纳入本条款。',
    },
    '51g6fqh0': {
      'en': '4. Content Guidelines',
      'ja': '4. コンテンツガイドライン',
      'zh_Hans': '4. 内容指南',
    },
    'sb344zni': {
      'en':
          'Users must not post, upload, or share any content that is illegal, harmful, threatening, abusive, harassing, defamatory, or otherwise objectionable.',
      'ja':
          'ユーザーは、違法、有害、脅迫的、虐待的、嫌がらせ的、中傷的、またはその他の不快なコンテンツを投稿、アップロード、または共有してはなりません。',
      'zh_Hans': '用户不得发布、上传或分享任何非法、有害、威胁、辱骂、骚扰、诽谤或其他令人反感的内容。',
    },
    'kx99mvz5': {
      'en': '5. Intellectual Property',
      'ja': '5. 知的財産',
      'zh_Hans': '5. 知识产权',
    },
    'mj536o8e': {
      'en':
          'All content and materials available in the application, including but not limited to text, graphics, logos, and software, are the property of the company or its licensors.',
      'ja':
          'アプリケーションで利用可能なすべてのコンテンツおよび資料（テキスト、グラフィック、ロゴ、ソフトウェアを含むがこれらに限定されない）は、当社またはそのライセンサーの所有物です。',
      'zh_Hans': '应用程序中提供的所有内容和材料，包括但不限于文本、图形、徽标和软件，均为本公司或其许可方的财产。',
    },
    'i2b32kxd': {
      'en': '6. Termination',
      'ja': '6. 終了',
      'zh_Hans': '6. 终止',
    },
    'z1msth77': {
      'en':
          'We reserve the right to terminate or suspend your account and access to the application at our sole discretion, without notice, for conduct that we believe violates these Terms or is harmful to other users.',
      'ja':
          '当社は、本規約に違反している、または他のユーザーに有害であると判断した行為があった場合、当社の独自の裁量により、予告なしにお客様のアカウントおよびアプリケーションへのアクセスを終了または停止する権利を留保します。',
      'zh_Hans':
          '如果我们认为您的行为违反了这些条款或对其他用户有害，我们保留自行决定终止或暂停您的帐户以及访问应用程序的权利，无需另行通知。',
    },
    'lhv3d4s3': {
      'en': '7. Changes to Terms',
      'ja': '7. 規約の変更',
      'zh_Hans': '7. 条款变更',
    },
    'srha8lhh': {
      'en':
          'We reserve the right to modify these Terms at any time. We will notify users of any material changes by posting the new Terms on the application.',
      'ja':
          '当社は、いつでも本規約を変更する権利を留保します。重要な変更があった場合は、アプリケーションに新しい規約を掲載することにより、ユーザーに通知します。',
      'zh_Hans': '我们保留随时修改这些条款的权利。我们将通过在应用程序上发布新条款的方式通知用户任何重大变更。',
    },
    '7n5zemap': {
      'en': 'Contact Us',
      'ja': 'お問い合わせ',
      'zh_Hans': '联系我们',
    },
    'p9mcm4w1': {
      'en':
          'If you have any questions about these Terms, please contact us at support@example.com',
      'ja': '本規約についてご質問がある場合は、support@example.com までお問い合わせください。',
      'zh_Hans': '如果您对这些条款有任何疑问，请通过 support@example.com 与我们联系。',
    },
  },
  // Leaderboard
  {
    'udd36kp5': {
      'en': 'Leaderboard',
      'ja': 'リーダーボード',
      'zh_Hans': '排行榜',
    },
    'u4o6knpq': {
      'en': 'All Participants',
      'ja': '参加者全員',
      'zh_Hans': '所有参与者',
    },
  },
  // RewardSuccess
  {
    'hr3j1nk6': {
      'en': 'Reawrd successful redemption!',
      'ja': 'Reward の交換に成功しました!',
      'zh_Hans': '獎勵兑现成功！',
    },
    'l57dduu0': {
      'en': 'Reward Success',
      'ja': '課題',
      'zh_Hans': '作业',
    },
    'x799h7zq': {
      'en': 'Home',
      'ja': '家',
      'zh_Hans': '家',
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
      'ja': '家',
      'zh_Hans': '主页',
    },
    '9onzbacz': {
      'en': 'Reward',
      'ja': '褒美',
      'zh_Hans': '奖品',
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
      'ja': '',
      'zh_Hans': '',
    },
    '13u7unx9': {
      'en': 'C',
      'ja': '',
      'zh_Hans': '',
    },
    '15u3r026': {
      'en': 'D',
      'ja': '',
      'zh_Hans': '',
    },
    'nh59tks5': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'z6kbff3s': {
      'en': 'Your Answer',
      'ja': 'あなたの答え',
      'zh_Hans': '您的答案',
    },
    '0u35dval': {
      'en': 'Enter your answer...',
      'ja': '回答を入力してください...',
      'zh_Hans': '输入您的答案...',
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
