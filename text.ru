<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tensor VPN — Загрузи свободу</title>
    <style>
        :root {
            --bg: #0a0a0f;
            --surface: #12121d;
            --surface2: #1a1a2e;
            --primary: #8b5cf6;
            --primary-glow: #a78bfa;
            --accent: #22c55e;
            --text: #f1f5f9;
            --text-muted: #94a3b8;
            --border: #2a2a3e;
            --gradient: linear-gradient(135deg, #8b5cf6, #6366f1);
            --gradient-card: linear-gradient(180deg, #1a1a2e 0%, #12121d 100%);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', 'Segoe UI', system-ui, -apple-system, sans-serif;
            background: var(--bg);
            color: var(--text);
            line-height: 1.6;
            overflow-x: hidden;
            -webkit-font-smoothing: antialiased;
        }

        /* Фоновые градиентные пятна */
        .bg-glow {
            position: fixed;
            border-radius: 50%;
            filter: blur(120px);
            opacity: 0.15;
            pointer-events: none;
            z-index: 0;
        }
        .bg-glow-1 {
            width: 600px;
            height: 600px;
            background: #8b5cf6;
            top: -200px;
            right: -200px;
        }
        .bg-glow-2 {
            width: 500px;
            height: 500px;
            background: #6366f1;
            bottom: -150px;
            left: -150px;
        }
        .bg-glow-3 {
            width: 400px;
            height: 400px;
            background: #22c55e;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            opacity: 0.06;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 24px;
            position: relative;
            z-index: 1;
        }

        /* Header */
        header {
            padding: 20px 0;
            position: sticky;
            top: 0;
            z-index: 100;
            background: rgba(10, 10, 15, 0.85);
            backdrop-filter: blur(20px);
            border-bottom: 1px solid var(--border);
        }
        header .container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
            text-decoration: none;
            color: var(--text);
            font-weight: 800;
            font-size: 22px;
            letter-spacing: -0.5px;
        }
        .logo-icon {
            width: 36px;
            height: 36px;
            background: var(--gradient);
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            box-shadow: 0 0 20px rgba(139, 92, 246, 0.4);
        }
        .nav-links {
            display: flex;
            gap: 32px;
            align-items: center;
        }
        .nav-links a {
            color: var(--text-muted);
            text-decoration: none;
            font-weight: 500;
            font-size: 15px;
            transition: color 0.2s;
        }
        .nav-links a:hover {
            color: var(--text);
        }
        .btn {
            padding: 10px 24px;
            border-radius: 12px;
            font-weight: 600;
            font-size: 14px;
            cursor: pointer;
            border: none;
            transition: all 0.25s;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }
        .btn-primary {
            background: var(--gradient);
            color: #fff;
            box-shadow: 0 4px 20px rgba(139, 92, 246, 0.35);
        }
        .btn-primary:hover {
            box-shadow: 0 6px 30px rgba(139, 92, 246, 0.55);
            transform: translateY(-1px);
        }
        .btn-outline {
            background: transparent;
            border: 1px solid var(--border);
            color: var(--text);
        }
        .btn-outline:hover {
            border-color: var(--primary);
            background: rgba(139, 92, 246, 0.08);
        }
        .btn-lg {
            padding: 14px 32px;
            font-size: 16px;
            border-radius: 14px;
        }

        /* Hero */
        .hero {
            padding: 80px 0 60px;
            text-align: center;
            position: relative;
        }
        .hero-badge {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: rgba(139, 92, 246, 0.15);
            border: 1px solid rgba(139, 92, 246, 0.3);
            border-radius: 50px;
            padding: 8px 18px;
            font-size: 13px;
            font-weight: 500;
            color: var(--primary-glow);
            margin-bottom: 28px;
        }
        .hero-badge .dot {
            width: 8px;
            height: 8px;
            background: var(--accent);
            border-radius: 50%;
            animation: pulse-dot 2s infinite;
        }
        @keyframes pulse-dot {
            0%,
            100% {
                opacity: 1;
                box-shadow: 0 0 6px var(--accent);
            }
            50% {
                opacity: 0.4;
                box-shadow: 0 0 12px var(--accent);
            }
        }
        .hero h1 {
            font-size: clamp(36px, 6vw, 64px);
            font-weight: 900;
            line-height: 1.15;
            letter-spacing: -1.5px;
            margin-bottom: 20px;
            background: linear-gradient(135deg, #f1f5f9 0%, #a78bfa 50%, #c4b5fd 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        .hero p {
            font-size: 18px;
            color: var(--text-muted);
            max-width: 560px;
            margin: 0 auto 36px;
        }
        .hero-buttons {
            display: flex;
            gap: 14px;
            justify-content: center;
            flex-wrap: wrap;
        }

        /* Фичи */
        .features {
            padding: 60px 0;
        }
        .section-label {
            text-transform: uppercase;
            letter-spacing: 3px;
            font-size: 12px;
            font-weight: 700;
            color: var(--primary-glow);
            margin-bottom: 12px;
        }
        .section-title {
            font-size: clamp(28px, 4vw, 42px);
            font-weight: 800;
            margin-bottom: 48px;
            letter-spacing: -0.5px;
        }
        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 20px;
        }
        .feature-card {
            background: var(--surface2);
            border: 1px solid var(--border);
            border-radius: 20px;
            padding: 32px 24px;
            transition: all 0.3s;
            position: relative;
            overflow: hidden;
        }
        .feature-card:hover {
            border-color: var(--primary);
            transform: translateY(-4px);
            box-shadow: 0 16px 40px rgba(0, 0, 0, 0.5);
        }
        .feature-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 2px;
            background: var(--gradient);
            opacity: 0;
            transition: opacity 0.3s;
        }
        .feature-card:hover::before {
            opacity: 1;
        }
        .feature-icon {
            width: 48px;
            height: 48px;
            background: rgba(139, 92, 246, 0.15);
            border-radius: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            margin-bottom: 18px;
        }
        .feature-card h3 {
            font-size: 18px;
            font-weight: 700;
            margin-bottom: 8px;
        }
        .feature-card p {
            font-size: 14px;
            color: var(--text-muted);
        }

        /* Тарифы */
        .pricing {
            padding: 60px 0;
        }
        .pricing-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            align-items: stretch;
        }
        .pricing-card {
            background: var(--surface2);
            border: 1px solid var(--border);
            border-radius: 24px;
            padding: 36px 28px;
            transition: all 0.3s;
            position: relative;
            display: flex;
            flex-direction: column;
        }
        .pricing-card:hover {
            border-color: var(--primary);
            box-shadow: 0 20px 48px rgba(0, 0, 0, 0.5);
        }
        .pricing-card.popular {
            border-color: var(--primary);
            background: var(--gradient-card);
            box-shadow: 0 0 40px rgba(139, 92, 246, 0.2);
        }
        .popular-badge {
            position: absolute;
            top: -14px;
            left: 50%;
            transform: translateX(-50%);
            background: var(--gradient);
            color: #fff;
            padding: 6px 20px;
            border-radius: 50px;
            font-size: 12px;
            font-weight: 700;
            white-space: nowrap;
            box-shadow: 0 4px 16px rgba(139, 92, 246, 0.4);
        }
        .pricing-card h3 {
            font-size: 22px;
            font-weight: 700;
            margin-bottom: 6px;
        }
        .pricing-card .price {
            font-size: 42px;
            font-weight: 900;
            margin: 12px 0 4px;
            letter-spacing: -1px;
        }
        .pricing-card .price span {
            font-size: 16px;
            font-weight: 500;
            color: var(--text-muted);
        }
        .pricing-card .price-sub {
            font-size: 13px;
            color: var(--text-muted);
            margin-bottom: 20px;
        }
        .pricing-card ul {
            list-style: none;
            margin-bottom: 28px;
            flex-grow: 1;
        }
        .pricing-card ul li {
            padding: 7px 0;
            font-size: 14px;
            color: var(--text-muted);
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .pricing-card ul li::before {
            content: '✓';
            color: var(--accent);
            font-weight: 700;
            font-size: 16px;
            flex-shrink: 0;
        }
        .pricing-card .btn {
            width: 100%;
            justify-content: center;
        }

        /* Сравнение */
        .compare {
            padding: 60px 0;
        }
        .compare-table {
            width: 100%;
            border-collapse: collapse;
            background: var(--surface2);
            border-radius: 20px;
            overflow: hidden;
            border: 1px solid var(--border);
        }
        .compare-table th,
        .compare-table td {
            padding: 16px 20px;
            text-align: left;
            font-size: 14px;
        }
        .compare-table th {
            background: rgba(139, 92, 246, 0.1);
            font-weight: 700;
            color: var(--primary-glow);
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 12px;
        }
        .compare-table tr {
            border-bottom: 1px solid var(--border);
        }
        .compare-table tr:last-child {
            border-bottom: none;
        }
        .check {
            color: var(--accent);
            font-weight: 700;
        }
        .cross {
            color: #ef4444;
            font-weight: 700;
        }

        /* CTA */
        .cta {
            padding: 80px 0;
            text-align: center;
        }
        .cta-card {
            background: var(--surface2);
            border: 1px solid var(--border);
            border-radius: 28px;
            padding: 56px 32px;
            position: relative;
            overflow: hidden;
        }
        .cta-card::after {
            content: '';
            position: absolute;
            width: 300px;
            height: 300px;
            background: #8b5cf6;
            filter: blur(150px);
            opacity: 0.1;
            top: -100px;
            right: -50px;
            border-radius: 50%;
        }
        .cta-card h2 {
            font-size: clamp(28px, 4vw, 40px);
            font-weight: 900;
            margin-bottom: 14px;
            position: relative;
            z-index: 1;
        }
        .cta-card p {
            color: var(--text-muted);
            margin-bottom: 28px;
            position: relative;
            z-index: 1;
        }
        .cta-card .btn {
            position: relative;
            z-index: 1;
        }

        /* Footer */
        footer {
            border-top: 1px solid var(--border);
            padding: 40px 0;
            text-align: center;
            color: var(--text-muted);
            font-size: 13px;
        }
        footer a {
            color: var(--primary-glow);
            text-decoration: none;
        }

        /* Адаптив */
        @media (max-width: 768px) {
            .nav-links {
                display: none;
            }
            .hero {
                padding: 50px 0 30px;
            }
            .pricing-grid {
                grid-template-columns: 1fr;
            }
            .compare-table {
                font-size: 12px;
            }
            .compare-table th,
            .compare-table td {
                padding: 12px 10px;
            }
        }
    </style>
</head>
<body>

    <div class="bg-glow bg-glow-1"></div>
    <div class="bg-glow bg-glow-2"></div>
    <div class="bg-glow bg-glow-3"></div>

    <!-- Header -->
    <header>
        <div class="container">
            <a href="#" class="logo">
                <div class="logo-icon">⚡</div>
                Tensor VPN
            </a>
            <nav class="nav-links">
                <a href="#features">Возможности</a>
                <a href="#pricing">Тарифы</a>
                <a href="#compare">Сравнение</a>
                <a href="#" class="btn btn-outline">Войти</a>
                <a href="#" class="btn btn-primary">Попробовать</a>
            </nav>
        </div>
    </header>

    <!-- Hero -->
    <section class="hero">
        <div class="container">
            <div class="hero-badge">
                <span class="dot"></span> Более 300 активных пользователей
            </div>
            <h1>Загрузи свободу<br>с Tensor VPN</h1>
            <p>Быстрый, анонимный и недорогой VPN для молодёжи. TikTok, YouTube, Telegram и ChatGPT — без лагов, рекламы и слежки.</p>
            <div class="hero-buttons">
                <a href="#pricing" class="btn btn-primary btn-lg">⚡ Выбрать тариф</a>
                <a href="#features" class="btn btn-outline btn-lg">Узнать больше ↓</a>
            </div>
        </div>
    </section>

    <!-- Фичи -->
    <section class="features" id="features">
        <div class="container">
            <div class="section-label">Почему Tensor</div>
            <div class="section-title">Ни рекламы. Ни логов.<br>Ни тормозов.</div>
            <div class="features-grid">
                <div class="feature-card">
                    <div class="feature-icon">🔒</div>
                    <h3>No Logs Policy</h3>
                    <p>Мы не храним логи. Вообще. Ни строчки. Твой трафик — только твой.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">⚡</div>
                    <h3>Скорость без границ</h3>
                    <p>Серверы в Москве и Санкт-Петербурге. Минимальный пинг, никаких лагов.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">🛡️</div>
                    <h3>Современное шифрование</h3>
                    <p>WireGuard и VLESS протоколы. Твой интернет под надёжной защитой.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">📱</div>
                    <h3>Все устройства</h3>
                    <p>iOS, Android, Windows, macOS. До 5 устройств на Pro-тарифе.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">💬</div>
                    <h3>ChatGPT всегда с тобой</h3>
                    <p>Нейросети без VPN не работают? С Tensor — работают. Pro-тариф открывает полный доступ.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">👥</div>
                    <h3>Приведи друга</h3>
                    <p>Реферальная программа: друг регистрируется — ты получаешь 30 минут Pro бесплатно.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Тарифы -->
    <section class="pricing" id="pricing">
        <div class="container">
            <div class="section-label">Тарифы</div>
            <div class="section-title">Дешевле кофе,<br>быстрее света</div>
            <div class="pricing-grid">
                <!-- Free -->
                <div class="pricing-card">
                    <h3>🚀 Free</h3>
                    <div class="price">0 ₽<span>/мес</span></div>
                    <div class="price-sub">Ознакомительный режим</div>
                    <ul>
                        <li>500 МБ трафика в день</li>
                        <li>1 устройство</li>
                        <li>Базовые сервисы</li>
                        <li>Стандартная скорость</li>
                        <li>Поддержка в Telegram</li>
                    </ul>
                    <a href="#" class="btn btn-outline">Начать бесплатно</a>
                </div>

                <!-- Lite -->
                <div class="pricing-card">
                    <h3>💜 Lite</h3>
                    <div class="price">149 ₽<span>/мес</span></div>
                    <div class="price-sub">Для повседневного использования</div>
                    <ul>
                        <li>Безлимитный трафик</li>
                        <li>1 устройство</li>
                        <li>YouTube, TikTok, Telegram</li>
                        <li>Высокая скорость</li>
                        <li>Приоритетная поддержка</li>
                    </ul>
                    <a href="#" class="btn btn-outline">Выбрать Lite</a>
                </div>

                <!-- Pro -->
                <div class="pricing-card popular">
                    <div class="popular-badge">🔥 Самый выгодный</div>
                    <h3>👑 Pro</h3>
                    <div class="price">199 ₽<span>/мес</span></div>
                    <div class="price-sub">Максимум возможностей</div>
                    <ul>
                        <li>Безлимитный трафик</li>
                        <li>До 5 устройств</li>
                        <li>Все сервисы + ChatGPT</li>
                        <li>Максимальная скорость</li>
                        <li>VIP-поддержка 24/7</li>
                        <li>Реферальный бонус ×2</li>
                    </ul>
                    <a href="#" class="btn btn-primary">Выбрать Pro 🔥</a>
                </div>

                <!-- Pro Год -->
                <div class="pricing-card">
                    <h3>💎 Pro Год</h3>
                    <div class="price">1 490 ₽<span>/год</span></div>
                    <div class="price-sub">Экономия 35% — как 124 ₽/мес</div>
                    <ul>
                        <li>Всё из Pro-тарифа</li>
                        <li>До 5 устройств</li>
                        <li>ChatGPT без ограничений</li>
                        <li>Защита на целый год</li>
                        <li>Гарантия возврата 7 дней</li>
                    </ul>
                    <a href="#" class="btn btn-outline">Выбрать Годовой</a>
                </div>
            </div>
        </div>
    </section>

    <!-- Сравнение -->
    <section class="compare" id="compare">
        <div class="container">
            <div class="section-label">Сравнение</div>
            <div class="section-title">Tensor против других</div>
            <div style="overflow-x: auto;">
                <table class="compare-table">
                    <thead>
                        <tr>
                            <th>Критерий</th>
                            <th>Бесплатные VPN</th>
                            <th>Дорогие VPN</th>
                            <th style="color: var(--primary-glow);">Tensor VPN</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Цена</td>
                            <td>0 ₽ (но вы товар)</td>
                            <td class="cross">800–1500 ₽/мес</td>
                            <td class="check">99–199 ₽/мес</td>
                        </tr>
                        <tr>
                            <td>Логирование</td>
                            <td class="cross">Продают данные</td>
                            <td class="check">Не всегда честны</td>
                            <td class="check">No Logs. 100%</td>
                        </tr>
                        <tr>
                            <td>Реклама</td>
                            <td class="cross">Баннеры и всплывашки</td>
                            <td class="check">Нет</td>
                            <td class="check">Нет</td>
                        </tr>
                        <tr>
                            <td>Скорость</td>
                            <td class="cross">Ограничена</td>
                            <td class="check">Высокая</td>
                            <td class="check">Максимальная</td>
                        </tr>
                        <tr>
                            <td>ChatGPT</td>
                            <td class="cross">Заблокирован</td>
                            <td class="check">Работает</td>
                            <td class="check">Работает</td>
                        </tr>
                        <tr>
                            <td>Устройства</td>
                            <td>1</td>
                            <td>До 10</td>
                            <td class="check">До 5 (Pro)</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

    <!-- CTA -->
    <section class="cta">
        <div class="container">
            <div class="cta-card">
                <h2>Готов загрузить свободу? 🚀</h2>
                <p>Подключи Tensor VPN за 2 минуты. Без логов, без рекламы, без тормозов.</p>
                <a href="#" class="btn btn-primary btn-lg">⚡ Попробовать бесплатно</a>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <p>© 2026 Tensor VPN. Все права защищены. | <a href="#">Политика конфиденциальности</a> | <a href="#">Оферта</a></p>
            <p style="margin-top: 6px;">Сделано с любовью для свободного интернета 💜</p>
        </div>
    </footer>

</body>
</html>
