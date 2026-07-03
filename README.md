# Niagara Service Resort Casino

A fully navigable visitor-service companion app prototype for a resort-casino
building, built with Flutter. It is **not** a gambling app — it focuses only on
guest support: requesting services, using a visitor pass, exploring resort
places, viewing building events, submitting event requests, and asking prepared
guest-support questions.

## Flow

Loader → Onboarding (first launch) → Main App. Onboarding is skipped on later
launches (in-memory for the prototype session).

## Bottom tabs

1. **Services** — browse guest services, submit request forms (with validation
   and confirmation), and track them in *My Service Requests*.
2. **Pass** — visitor pass card with a QR-like graphic, brightness mode and a
   bright fullscreen pass for staff.
3. **Resort** — *Places* and *Saved* segmented tabs, place detail screens, plus
   save and share actions.
4. **Events** — current-week calendar, photo-free event cards (Past / Today /
   Upcoming), event detail screens, event request form and *My Event Requests*.
5. **Assistant** — predefined question/answer guest-support chat (no AI, no
   external calls).

## State

Local, in-memory (`AppState` exposed via `AppScope`): onboarding completion,
submitted service and event requests, saved places, pass brightness and chat
history. No backend, login or payments.

## Design

Dark emerald resort theme derived from the supplied imagery — deep emerald and
forest greens, neon-green accents, gold interior light, cream text and a red
diamond accent. Solid (never semi-transparent) cards, hidden scrollbars, iPhone
safe areas.

## Run

```bash
flutter run                 # normal flow (loader → onboarding → app)
flutter test                # widget flow tests in test/app_flow_test.dart
```

QA build hooks: `--dart-define=SKIP_ONBOARDING=true` boots straight to the main
app, and `--dart-define=INITIAL_TAB=<0-4>` opens a specific tab.
