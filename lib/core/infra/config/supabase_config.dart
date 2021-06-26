import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase/supabase.dart';

class SupaBase {
  SupaBase._();

  static final _supabaseUrl = dotenv.env['SUPABASE_URL'];
  static final _supabaseKey = dotenv.env['SUPABASE_SECRET'];
  static late SupabaseClient _supabase;

  static void init() {
    if (_supabaseUrl == null || _supabaseKey == null) {
      return;
    }

    _supabase = SupabaseClient(_supabaseUrl!, _supabaseKey!);
  }

  static SupabaseClient get supabaseClient => _supabase;

  static Future<void> test() async {
    final response = await supabaseClient.from('users').select().execute();

    if (response.error != null) {}

    if (response.data != null) {}
  }
}
