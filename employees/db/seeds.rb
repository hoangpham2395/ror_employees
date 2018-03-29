# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: 'tuannm', password: '123456', fullname: 'Nguyễn Mạnh Tuấn', email_company: 'tuannm@gmail.com', email_personal: 'tuannm@gmail.com', tel: '0123456782', gender: 1, birthday: '12/05/1992', image: '', department: 'App', position: 'Employee', user_type: 'Offical', skill: 'iOS', literacy: 'Đại học', contract_type: '3 tháng', status: 'Joining', address: 'Việt Nam', bank_account: '711AA232323', id_number: '174444989', description: '', join_datetime: '14/03/2017', exit_datetime: '', leavedays_have: 10, leavedays_took: 0, leavedays_note: '', del_flag: 0)

User.create(username: 'hoalt', password: '123456', fullname: 'Lê Thị Hoa', email_company: 'hoalt@gmail.com', email_personal: 'hoalt@gmail.com', tel: '0123446782', gender: 2, birthday: '12/06/1992', image: '', department: 'App', position: 'Tester', user_type: 'Offical', skill: 'iOS', literacy: 'Đại học', contract_type: '3 tháng', status: 'Joining', address: 'Việt Nam', bank_account: '711AA232320', id_number: '174454989', description: '', join_datetime: '14/03/2017', exit_datetime: '', leavedays_have: 10, leavedays_took: 0, leavedays_note: '', del_flag: 0)

User.create(username: 'dungdv', password: '123456', fullname: 'Đinh Văn Dũng', email_company: 'dungdv@gmail.com', email_personal: 'dungdv@gmail.com', tel: '0123756782', gender: 1, birthday: '12/05/1995', image: '', department: 'Web', position: 'Employee', user_type: 'Offical', skill: 'Ruby', literacy: 'Đại học', contract_type: '3 tháng', status: 'Joining', address: 'Việt Nam', bank_account: '711AA662323', id_number: '174214989', description: '', join_datetime: '14/03/2017', exit_datetime: '', leavedays_have: 10, leavedays_took: 0, leavedays_note: '', del_flag: 0)