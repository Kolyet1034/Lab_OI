#!/bin/bash

file="contacts.txt"
name=""
phone=""
email=""
query=""

add_contact(){
	read -p "Имя: " name
	read -p "Телефон: " phone
	read -p "Почта: " email

	echo "${name}; ${phone}; ${email}" >> "$(pwd)/$file"
	echo "Контакт добавален!"
}

search(){
	read -p "Введите имя для поиска: " query

	echo "Найденное содержимое файла: "
	echo "$(grep -i -F -- $query $file)"
}

delete(){
	read -p "Введите имя для удаления: " query

	echo "Контакт $query успешно удален!"
	echo "$(sed -i  /$query/d  $file)"
}

while true
do
	echo
	echo "1-показать все контакты"
	echo "2-добавить контакт"
	echo "3-удалить контакт"
	echo "4-поиск контакта"
	echo "0-выход"
	read -p "Выберите действие: " choice
	echo

case $choice in
1)
	cat "$file"
;;
2)
 add_contact
;;
3)
 delete
;;
4)
 search
;;
0)
 break
;;
esac
done
