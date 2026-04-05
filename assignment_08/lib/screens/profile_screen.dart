import 'package:flutter/material.dart';
import 'package:ubit_hub/app_theme.dart';
import 'package:ubit_hub/mock_data.dart';
import '../../../widgets/profile_strength_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController(text: 'Alex Harrison');
  final _studentIdController = TextEditingController(text: 'UB-9283471');

  String? _selectedDepartment = departments.first;
  String _gender = 'male'; // 'male' | 'female' | 'non-binary'

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _nameController.dispose();
    _studentIdController.dispose();
    super.dispose();
  }

  void _onSaveChanges() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profile updated successfully'),
          backgroundColor: AppTheme.success,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surface,
      body: Column(
        children: [
          // Profile header card
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // Avatar
                    Container(
                      width: 52,
                      height: 52,
                      decoration: const BoxDecoration(
                        color: AppTheme.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          'AH',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'STUDENT ACCOUNT',
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                              color: AppTheme.textMuted,
                            ),
                          ),
                          Text(
                            'Alex Harrison',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: AppTheme.textPrimary,
                            ),
                          ),
                          Text(
                            'Computer Science & Engineering · Class of 2025',
                            style: TextStyle(
                              fontSize: 11,
                              color: AppTheme.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Verified badge
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.success.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: AppTheme.success.withValues(alpha: 0.3)),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.verified, size: 12, color: AppTheme.success),
                      SizedBox(width: 4),
                      Text(
                        'Verified Student',
                        style: TextStyle(
                          fontSize: 11,
                          color: AppTheme.success,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // TabBar
                TabBar(
                  controller: _tabController,
                  labelColor: AppTheme.primary,
                  unselectedLabelColor: AppTheme.textMuted,
                  indicatorColor: AppTheme.primary,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelStyle: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w600),
                  unselectedLabelStyle: const TextStyle(fontSize: 13),
                  tabs: const [
                    Tab(text: 'Personal Info'),
                    Tab(text: 'My Listings'),
                    Tab(text: 'Saved'),
                  ],
                ),
              ],
            ),
          ),

          // TabBarView
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _PersonalInfoTab(
                  formKey: _formKey,
                  nameController: _nameController,
                  studentIdController: _studentIdController,
                  selectedDepartment: _selectedDepartment,
                  gender: _gender,
                  onDepartmentChanged: (val) =>
                      setState(() => _selectedDepartment = val),
                  onGenderChanged: (val) => setState(() => _gender = val!),
                  onSave: _onSaveChanges,
                ),
                const _PlaceholderTab(label: 'My Listings'),
                const _PlaceholderTab(label: 'Saved Items'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Personal Info tab ────────────────────────────────────────────────────────

class _PersonalInfoTab extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController studentIdController;
  final String? selectedDepartment;
  final String gender;
  final ValueChanged<String?> onDepartmentChanged;
  final ValueChanged<String?> onGenderChanged;
  final VoidCallback onSave;

  const _PersonalInfoTab({
    required this.formKey,
    required this.nameController,
    required this.studentIdController,
    required this.selectedDepartment,
    required this.gender,
    required this.onDepartmentChanged,
    required this.onGenderChanged,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionLabel('Profile Identity'),
            const SizedBox(height: 12),

            // Full name
            const _FieldLabel('Full Name'),
            const SizedBox(height: 6),
            TextFormField(
              controller: nameController,
              validator: (v) =>
                  v == null || v.trim().isEmpty ? 'Name is required' : null,
            ),
            const SizedBox(height: 14),

            // Student ID
            const _FieldLabel('Student ID'),
            const SizedBox(height: 6),
            TextFormField(
              controller: studentIdController,
              validator: (v) => v == null || v.trim().isEmpty
                  ? 'Student ID is required'
                  : null,
            ),
            const SizedBox(height: 14),

            // Department dropdown
            const _FieldLabel('Department Selection'),
            const SizedBox(height: 6),
            DropdownButtonFormField<String>(
              initialValue: selectedDepartment,
              decoration: const InputDecoration(),
              style: const TextStyle(
                fontSize: 13,
                color: AppTheme.textPrimary,
              ),
              items: departments
                  .map((d) => DropdownMenuItem(
                        value: d,
                        child: Text(d, overflow: TextOverflow.ellipsis),
                      ))
                  .toList(),
              onChanged: onDepartmentChanged,
              validator: (v) => v == null ? 'Select a department' : null,
            ),
            const SizedBox(height: 16),

            // Gender radio buttons
            const _FieldLabel('Gender Identification'),
            const SizedBox(height: 8),
            _GenderRadioGroup(
              selectedValue: gender,
              onChanged: onGenderChanged,
            ),
            const SizedBox(height: 20),

            // Action buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(0, 46),
                      side: const BorderSide(color: AppTheme.border),
                      foregroundColor: AppTheme.textSecondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onSave,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(0, 46),
                    ),
                    child: const Text('Save Changes'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Profile strength card
            const ProfileStrengthCard(strength: 0.85),
            const SizedBox(height: 16),

            // Privacy note
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppTheme.border),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info_outline, size: 16, color: AppTheme.textMuted),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Privacy Note',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Your department information helps us tailor marketplace recommendations and campus alerts.',
                          style: TextStyle(
                            fontSize: 11,
                            color: AppTheme.textSecondary,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GenderRadioGroup extends StatelessWidget {
  final String selectedValue;
  final ValueChanged<String?> onChanged;

  const _GenderRadioGroup({
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: RadioListTile<String>(
                value: 'male',
                groupValue: selectedValue,
                onChanged: onChanged,
                title: const Text('Male', style: TextStyle(fontSize: 13)),
                dense: true,
                contentPadding: EdgeInsets.zero,
                activeColor: AppTheme.primary,
              ),
            ),
            Expanded(
              child: RadioListTile<String>(
                value: 'female',
                groupValue: selectedValue,
                onChanged: onChanged,
                title: const Text('Female', style: TextStyle(fontSize: 13)),
                dense: true,
                contentPadding: EdgeInsets.zero,
                activeColor: AppTheme.primary,
              ),
            ),
          ],
        ),
        RadioListTile<String>(
          value: 'non-binary',
          groupValue: selectedValue,
          onChanged: onChanged,
          title: const Text('Non-binary', style: TextStyle(fontSize: 13)),
          dense: true,
          contentPadding: EdgeInsets.zero,
          activeColor: AppTheme.primary,
        ),
      ],
    );
  }
}

// ── Shared small widgets ─────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          const Icon(Icons.person_outline, size: 15, color: AppTheme.accent),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary,
            ),
          ),
        ],
      );
}

class _FieldLabel extends StatelessWidget {
  final String text;
  const _FieldLabel(this.text);

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppTheme.textSecondary,
        ),
      );
}

class _PlaceholderTab extends StatelessWidget {
  final String label;
  const _PlaceholderTab({required this.label});

  @override
  Widget build(BuildContext context) => Center(
        child: Text(
          label,
          style: const TextStyle(color: AppTheme.textMuted),
        ),
      );
}
