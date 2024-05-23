// إعداد تاريخ الميلاد
flatpickr("#birth_date", {
    dateFormat: "Y-m-d",
    locale: {
        weekdays: {
            shorthand: ["أحد", "إثنين", "ثلاثاء", "أربعاء", "خميس", "جمعة", "سبت"],
            longhand: ["الأحد", "الإثنين", "الثلاثاء", "الأربعاء", "الخميس", "الجمعة", "السبت"],
        },
        months: {
            shorthand: ["يناير", "فبراير", "مارس", "أبريل", "مايو", "يونيو", "يوليو", "أغسطس", "سبتمبر", "أكتوبر", "نوفمبر", "ديسمبر"],
            longhand: ["يناير", "فبراير", "مارس", "أبريل", "مايو", "يونيو", "يوليو", "أغسطس", "سبتمبر", "أكتوبر", "نوفمبر", "ديسمبر"],
        },
    }
});

// قائمة العناصر
const accountData = [
    { id: 'account', className: 'account', text: 'عدد الحسابات: ' },
    { id: 'bookAccount', className: 'book-account', text: 'عدد الحسابات الكتاب: ' },
    { id: 'readerAccount', className: 'reader-account', text: 'عدد الحسابات للقراء: ' },
    { id: 'firstSubscription', className: 'first-subscription', text: 'عدد الحسابات المشتركة بالاشتراك الاول: ' },
    { id: 'secondSubscription', className: 'second-subscription', text: 'عدد الحسابات المشتركة بالاشتراك الثاني: ' },
    { id: 'canceledAccount', className: 'canceled-account', text: 'عدد الحسابات الملغية: ' }
];

// توليد العناصر داخل الـ <ul><li> بشكل ديناميكي
const accountList = document.getElementById('accountList');
accountData.forEach(item => {
    const listItem = document.createElement('li');
    listItem.id = item.id;
    listItem.className = item.className;
    listItem.textContent = item.text;
    const span = document.createElement('span');
    span.id = `${item.id}Text`;
    listItem.appendChild(span);
    accountList.appendChild(listItem);
});

// تعديل النصوص
document.getElementById('accountText').textContent = 'النص الجديد لعدد الحسابات';
document.getElementById('bookAccountText').textContent = 'النص الجديد لعدد الحسابات الكتاب';
document.getElementById('readerAccountText').textContent = 'النص الجديد لعدد الحسابات للقراء';
document.getElementById('firstSubscriptionText').textContent = 'النص الجديد لعدد الحسابات المشتركة بالاشتراك الاول';
document.getElementById('secondSubscriptionText').textContent = 'النص الجديد لعدد الحسابات المشتركة بالاشتراك الثاني';
document.getElementById('canceledAccountText').textContent = 'النص الجديد لعدد الحسابات الملغية';

// قائمة بالمستخدمين المسجلين
let users = [];

// كائن لتمثيل المستخدم
class User {
    constructor(username, password) {
        this.username = username;
        this.password = password;
        this.stories = [];
    }

    // إضافة قصة
    addStory(story) {
        this.stories.push(story);
    }
}

// تسجيل مستخدم جديد
function signUp(username, password) {
    // التحقق مما إذا كان اسم المستخدم مأخوذاً بالفعل
    const existingUser = users.find(user => user.username === username);
    if (existingUser) {
        return "اسم المستخدم مأخوذ بالفعل";
    } else {
        const newUser = new User(username, password);
        users.push(newUser);
        return "تم إنشاء الحساب بنجاح";
    }
}

// تسجيل الدخول
function signIn(username, password) {
    // البحث عن المستخدم المناسب باستخدام اسم المستخدم وكلمة المرور
    const currentUser = users.find(user => user.username === username && user.password === password);
    if (currentUser) {
        return "تم تسجيل الدخول بنجاح";
    } else {
        return "اسم المستخدم أو كلمة المرور غير صحيحة";
    }
}

// مثال على استخدام الدوال
console.log(signUp("user1", "password123")); // تم إنشاء الحساب بنجاح
console.log(signUp("user1", "password123")); // اسم المستخدم مأخوذ بالفعل

console.log(signIn("user1", "password123")); // تم تسجيل الدخول بنجاح
console.log(signIn("user1", "wrongpassword")); // اسم المستخدم أو كلمة المرور غير صحيحة

// التحقق من تطابق كلمة المرور
function validatePassword() {
    var password = document.getElementById("password").value;
    var confirmPassword = document.getElementById("confirm_password").value;
    if (password != confirmPassword) {
        alert("كلمة السر غير متطابقة");
        return false;
    }
    return true;
}

class search {
    
}