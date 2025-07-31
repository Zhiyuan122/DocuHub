# Create default admin user
admin = Admin.find_or_create_by(username: 'admin') do |a|
  a.email = 'admin@docuhub.com'
  a.password = 'admin123'
  a.password_confirmation = 'admin123'
end

puts "Admin user created: #{admin.username}"

# Create some sample documents for testing
if Document.count.zero?
  5.times do |i|
    doc = Document.create!(
      tracking_code: Document.generate_tracking_code,
      original_filename: "sample_document_#{i + 1}.pdf",
      file: File.open(Rails.root.join('public', 'sample.pdf')) rescue nil,
      file_size: rand(100000..5000000),
      mime_type: 'application/pdf',
      status: ['pending', 'processing', 'completed'].sample,
      notes: "Sample document #{i + 1} for testing purposes"
    )
    
    # Create status history
    doc.status_histories.create!(
      status: doc.status,
      notes: "Sample status for document #{i + 1}",
      updated_at: doc.created_at
    )
    
    puts "Sample document created: #{doc.tracking_code}"
  end
end 