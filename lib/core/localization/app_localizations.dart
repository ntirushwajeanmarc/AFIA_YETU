import 'package:flutter/material.dart';

class AppLocalizations {
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const List<Locale> supportedLocales = [
    Locale('en', ''),
    Locale('fr', ''),
  ];

  final Locale locale;

  AppLocalizations(this.locale);

  // Navigation
  String get home => locale.languageCode == 'fr' ? 'Accueil' : 'Home';
  String get appointments =>
      locale.languageCode == 'fr' ? 'Rendez-vous' : 'Appointments';
  String get documents =>
      locale.languageCode == 'fr' ? 'Documents' : 'Documents';
  String get messages => locale.languageCode == 'fr' ? 'Messages' : 'Messages';
  String get account => locale.languageCode == 'fr' ? 'Compte' : 'Account';

  // Home Screen
  String get welcomeMessage => locale.languageCode == 'fr'
      ? 'Bonjour! Comment vous sentez-vous aujourd\'hui?'
      : 'Hello! How are you feeling today?';
  String get quickActions =>
      locale.languageCode == 'fr' ? 'Actions Rapides' : 'Quick Actions';
  String get bookAppointment =>
      locale.languageCode == 'fr' ? 'Prendre RDV' : 'Book Appointment';
  String get findDoctor =>
      locale.languageCode == 'fr' ? 'Trouver Médecin' : 'Find Doctor';
  String get pharmacy => locale.languageCode == 'fr' ? 'Pharmacie' : 'Pharmacy';
  String get emergencyCall =>
      locale.languageCode == 'fr' ? 'Urgence' : 'Emergency';
  String get upcomingAppointments => locale.languageCode == 'fr'
      ? 'Prochains Rendez-vous'
      : 'Upcoming Appointments';
  String get healthTips =>
      locale.languageCode == 'fr' ? 'Conseils Santé' : 'Health Tips';
  String get drinkWater => locale.languageCode == 'fr'
      ? 'Buvez de l\'eau régulièrement'
      : 'Drink water regularly';
  String get exercise => locale.languageCode == 'fr'
      ? 'Faites 30 minutes d\'exercice par jour'
      : 'Exercise for 30 minutes daily';
  String get eatHealthy => locale.languageCode == 'fr'
      ? 'Mangez des fruits et légumes'
      : 'Eat fruits and vegetables';

  // Authentication
  String get login => locale.languageCode == 'fr' ? 'Connexion' : 'Login';
  String get signup => locale.languageCode == 'fr' ? 'S\'inscrire' : 'Sign Up';
  String get email => locale.languageCode == 'fr' ? 'E-mail' : 'Email';
  String get password =>
      locale.languageCode == 'fr' ? 'Mot de passe' : 'Password';
  String get confirmPassword => locale.languageCode == 'fr'
      ? 'Confirmer le mot de passe'
      : 'Confirm Password';
  String get fullName =>
      locale.languageCode == 'fr' ? 'Nom complet' : 'Full Name';
  String get phoneNumber =>
      locale.languageCode == 'fr' ? 'Numéro de téléphone' : 'Phone Number';
  String get forgotPassword =>
      locale.languageCode == 'fr' ? 'Mot de passe oublié?' : 'Forgot Password?';
  String get createAccount =>
      locale.languageCode == 'fr' ? 'Créer un compte' : 'Create Account';
  String get alreadyHaveAccount => locale.languageCode == 'fr'
      ? 'Vous avez déjà un compte?'
      : 'Already have an account?';
  String get dontHaveAccount => locale.languageCode == 'fr'
      ? 'Vous n\'avez pas de compte?'
      : 'Don\'t have an account?';
  String get agreeToTerms => locale.languageCode == 'fr'
      ? 'J\'accepte les conditions d\'utilisation'
      : 'I agree to Terms and Conditions';
  String get loginWithGoogle => locale.languageCode == 'fr'
      ? 'Continuer avec Google'
      : 'Continue with Google';
  String get loginWithFacebook => locale.languageCode == 'fr'
      ? 'Continuer avec Facebook'
      : 'Continue with Facebook';
  String get loginWithApple => locale.languageCode == 'fr'
      ? 'Continuer avec Apple'
      : 'Continue with Apple';

  // Account Screen
  String get premiumMember =>
      locale.languageCode == 'fr' ? 'Membre Premium' : 'Premium Member';
  String get health => locale.languageCode == 'fr' ? 'Santé' : 'Health';
  String get healthRecords =>
      locale.languageCode == 'fr' ? 'Dossiers Médicaux' : 'Health Records';
  String get viewMedicalHistory => locale.languageCode == 'fr'
      ? 'Voir votre historique médical'
      : 'View your medical history';
  String get medications =>
      locale.languageCode == 'fr' ? 'Médicaments' : 'Medications';
  String get managePrescriptions => locale.languageCode == 'fr'
      ? 'Gérer vos ordonnances'
      : 'Manage your prescriptions';
  String get settings =>
      locale.languageCode == 'fr' ? 'Paramètres' : 'Settings';
  String get notifications =>
      locale.languageCode == 'fr' ? 'Notifications' : 'Notifications';
  String get manageAlerts =>
      locale.languageCode == 'fr' ? 'Gérer vos alertes' : 'Manage your alerts';
  String get privacySecurity => locale.languageCode == 'fr'
      ? 'Confidentialité et Sécurité'
      : 'Privacy & Security';
  String get managePrivacy => locale.languageCode == 'fr'
      ? 'Gérer vos paramètres de confidentialité'
      : 'Manage your privacy settings';
  String get language => locale.languageCode == 'fr' ? 'Langue' : 'Language';
  String get support => locale.languageCode == 'fr' ? 'Support' : 'Support';
  String get helpSupport =>
      locale.languageCode == 'fr' ? 'Aide et Support' : 'Help & Support';
  String get getHelp => locale.languageCode == 'fr'
      ? 'Obtenir de l\'aide avec l\'application'
      : 'Get help with the app';
  String get about => locale.languageCode == 'fr' ? 'À propos' : 'About';
  String get appVersionInfo => locale.languageCode == 'fr'
      ? 'Version de l\'application et informations'
      : 'App version and info';
  String get logout => locale.languageCode == 'fr' ? 'Déconnexion' : 'Logout';

  // Appointments
  String get findDoctors =>
      locale.languageCode == 'fr' ? 'Trouver des Médecins' : 'Find Doctors';
  String get searchDoctors => locale.languageCode == 'fr'
      ? 'Rechercher des médecins...'
      : 'Search doctors...';
  String get specialties =>
      locale.languageCode == 'fr' ? 'Spécialités' : 'Specialties';
  String get cardiology =>
      locale.languageCode == 'fr' ? 'Cardiologie' : 'Cardiology';
  String get dermatology =>
      locale.languageCode == 'fr' ? 'Dermatologie' : 'Dermatology';
  String get neurology =>
      locale.languageCode == 'fr' ? 'Neurologie' : 'Neurology';
  String get pediatrics =>
      locale.languageCode == 'fr' ? 'Pédiatrie' : 'Pediatrics';
  String get orthopedics =>
      locale.languageCode == 'fr' ? 'Orthopédie' : 'Orthopedics';
  String get topDoctors =>
      locale.languageCode == 'fr' ? 'Meilleurs Médecins' : 'Top Doctors';
  String get myAppointments =>
      locale.languageCode == 'fr' ? 'Mes Rendez-vous' : 'My Appointments';
  String get upcoming => locale.languageCode == 'fr' ? 'À venir' : 'Upcoming';
  String get past => locale.languageCode == 'fr' ? 'Passés' : 'Past';
  String get confirmed =>
      locale.languageCode == 'fr' ? 'Confirmé' : 'Confirmed';
  String get pending => locale.languageCode == 'fr' ? 'En attente' : 'Pending';
  String get completed => locale.languageCode == 'fr' ? 'Terminé' : 'Completed';

  // Pharmacy
  String get ePharmacy =>
      locale.languageCode == 'fr' ? 'E-Pharmacie' : 'E-Pharmacy';
  String get searchMedications => locale.languageCode == 'fr'
      ? 'Rechercher des médicaments...'
      : 'Search medications...';
  String get painRelief =>
      locale.languageCode == 'fr' ? 'Anti-douleur' : 'Pain Relief';
  String get vitamins => locale.languageCode == 'fr' ? 'Vitamines' : 'Vitamins';
  String get antibiotics =>
      locale.languageCode == 'fr' ? 'Antibiotiques' : 'Antibiotics';
  String get heartHealth =>
      locale.languageCode == 'fr' ? 'Santé Cardiaque' : 'Heart Health';
  String get diabetes => locale.languageCode == 'fr' ? 'Diabète' : 'Diabetes';
  String get skincare =>
      locale.languageCode == 'fr' ? 'Soins de la Peau' : 'Skincare';
  String get inStock => locale.languageCode == 'fr' ? 'En stock' : 'In Stock';
  String get outOfStock =>
      locale.languageCode == 'fr' ? 'Rupture de stock' : 'Out of Stock';
  String get prescriptionRequired => locale.languageCode == 'fr'
      ? 'Ordonnance requise'
      : 'Prescription Required';
  String get uploadPrescription => locale.languageCode == 'fr'
      ? 'Télécharger Ordonnance'
      : 'Upload Prescription';
  String get addToCart =>
      locale.languageCode == 'fr' ? 'Ajouter au Panier' : 'Add to Cart';

  // Messages
  String get doctorConsultations => locale.languageCode == 'fr'
      ? 'Consultations Médicales'
      : 'Doctor Consultations';
  String get generalSupport =>
      locale.languageCode == 'fr' ? 'Support Général' : 'General Support';
  String get videoCall =>
      locale.languageCode == 'fr' ? 'Appel Vidéo' : 'Video Call';
  String get voiceCall =>
      locale.languageCode == 'fr' ? 'Appel Vocal' : 'Voice Call';
  String get textMessage =>
      locale.languageCode == 'fr' ? 'Message Texte' : 'Text Message';

  // Common
  String get loading =>
      locale.languageCode == 'fr' ? 'Chargement...' : 'Loading...';
  String get comingSoon =>
      locale.languageCode == 'fr' ? 'Bientôt disponible' : 'Coming Soon';
  String get featureInDevelopment => locale.languageCode == 'fr'
      ? 'Cette fonctionnalité est en cours de développement et sera disponible dans une prochaine mise à jour.'
      : 'This feature is currently under development and will be available in a future update.';
  String get ok => locale.languageCode == 'fr' ? 'OK' : 'OK';
  String get cancel => locale.languageCode == 'fr' ? 'Annuler' : 'Cancel';
  String get close => locale.languageCode == 'fr' ? 'Fermer' : 'Close';
  String get save => locale.languageCode == 'fr' ? 'Enregistrer' : 'Save';
  String get search => locale.languageCode == 'fr' ? 'Rechercher' : 'Search';
  String get all => locale.languageCode == 'fr' ? 'Tous' : 'All';
  String get selectLanguage =>
      locale.languageCode == 'fr' ? 'Choisir la langue' : 'Select Language';
  String get english => locale.languageCode == 'fr' ? 'Anglais' : 'English';
  String get french => locale.languageCode == 'fr' ? 'Français' : 'French';

  // Validation Messages
  String get pleaseEnterEmail => locale.languageCode == 'fr'
      ? 'Veuillez saisir votre e-mail'
      : 'Please enter your email';
  String get pleaseEnterValidEmail => locale.languageCode == 'fr'
      ? 'Veuillez saisir un e-mail valide'
      : 'Please enter a valid email';
  String get pleaseEnterPassword => locale.languageCode == 'fr'
      ? 'Veuillez saisir votre mot de passe'
      : 'Please enter your password';
  String get passwordTooShort => locale.languageCode == 'fr'
      ? 'Le mot de passe doit contenir au moins 6 caractères'
      : 'Password must be at least 6 characters';
  String get passwordsDoNotMatch => locale.languageCode == 'fr'
      ? 'Les mots de passe ne correspondent pas'
      : 'Passwords do not match';
  String get pleaseEnterName => locale.languageCode == 'fr'
      ? 'Veuillez saisir votre nom'
      : 'Please enter your name';
  String get pleaseEnterPhone => locale.languageCode == 'fr'
      ? 'Veuillez saisir votre numéro de téléphone'
      : 'Please enter your phone number';
  String get pleaseAcceptTerms => locale.languageCode == 'fr'
      ? 'Veuillez accepter les conditions d\'utilisation'
      : 'Please accept the terms and conditions';
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'fr'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
