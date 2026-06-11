lucide.createIcons();

let currentMode = 'login';

// UI references
const card = document.getElementById('card');
const content = document.getElementById('form-content');
const signupExtras = document.getElementById('names-row');
const deptRow = document.getElementById('dept-row');
const cpwRow = document.getElementById('cpw-group');
const meter = document.getElementById('meter-box');
const forgotSection = document.getElementById('forgot-wrap');
const switchBtn = document.getElementById('switch-btn');
const footerLabel = document.getElementById('foot-txt');
const actionBtn = document.getElementById('submit-btn');
const actionLabel = document.getElementById('btn-label');
const viewTitle = document.getElementById('view-title');
const viewSubtitle = document.getElementById('view-subtitle');
const passIn = document.getElementById('password');

document.addEventListener('DOMContentLoaded', () => {
    loadDepartments();
    content.classList.add('view-active');
});

function loadDepartments() {
    const deptSelect = document.getElementById('department');
    fetch('../Backend/get_Departments.php')
        .then(res => res.json())
        .then(data => {
            deptSelect.innerHTML = '<option value="" disabled selected>Select Department</option>';
            data.forEach(dept => {
                const option = document.createElement('option');
                option.value = dept.name;
                option.textContent = dept.name;
                deptSelect.appendChild(option);
            });
        })
        .catch(err => console.error('Error:', err));
}

function toggleView(mode) {
    currentMode = mode;
    content.classList.remove('view-active');
    
    setTimeout(() => {
        card.classList.toggle('is-signup', mode === 'signup');
        
        if(mode === 'login') {
            viewTitle.textContent = 'Log In';
            viewSubtitle.textContent = 'Enter your credentials to continue.';
            actionLabel.textContent = 'Log In';
            signupExtras.classList.add('hidden');
            deptRow.classList.add('hidden');
            cpwRow.classList.add('hidden');
            meter.classList.add('hidden');
            forgotSection.classList.remove('hidden');
            switchBtn.textContent = 'Sign Up';
            footerLabel.textContent = "New around here?";
        } else {
            viewTitle.textContent = 'Sign Up';
            viewSubtitle.textContent = 'Create your secure account.';
            actionLabel.textContent = 'Create Account';
            signupExtras.classList.remove('hidden');
            deptRow.classList.remove('hidden');
            cpwRow.classList.remove('hidden');
            meter.classList.remove('hidden');
            forgotSection.classList.add('hidden');
            switchBtn.textContent = 'Log In';
            footerLabel.textContent = "Already a member?";
        }
        lucide.createIcons();
        setTimeout(() => content.classList.add('view-active'), 50);
    }, 400);
}

// Password toggle
document.querySelectorAll('.password-toggle').forEach(btn => {
    btn.addEventListener('click', () => {
        const input = document.getElementById(btn.getAttribute('data-target'));
        const icon = btn.querySelector('i');
        if (input.type === 'password') {
            input.type = 'text';
            icon.setAttribute('data-lucide', 'eye-off');
        } else {
            input.type = 'password';
            icon.setAttribute('data-lucide', 'eye');
        }
        lucide.createIcons();
    });
});

switchBtn.addEventListener('click', () => toggleView(currentMode === 'login' ? 'signup' : 'login'));

// Removed e.preventDefault() for login to allow PHP redirection.
// Registration will still need a separate register_action.php if using direct POST.
document.getElementById('auth-form').addEventListener('submit', function(e) {
    if (currentMode === 'login') {
        // Allow standard form submission for redirection
        actionLabel.textContent = 'Authenticating...';
        return; 
    }

    // Signup logic still uses AJAX (Requires register.php to return JSON)
    e.preventDefault();
    actionBtn.disabled = true;
    const prevLabel = actionLabel.textContent;
    actionLabel.textContent = 'Processing...';

    const formData = new FormData(this);
    const payload = Object.fromEntries(formData.entries());

    fetch('../Backend/register.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload)
    })
    .then(res => res.json())
    .then(data => {
        if (data.status === 'success') {
            toggleView('login');
        } else {
            alert(data.msg || 'Registration failed.');
        }
    })
    .catch(() => alert('Server connection failed.'))
    .finally(() => {
        actionBtn.disabled = false;
        actionLabel.textContent = prevLabel;
    });
});

// Strength Meter Logic
passIn.addEventListener('input', () => {
    if (currentMode !== 'signup') return;
    const val = passIn.value;
    const tests = {
        len: val.length >= 8,
        num: /\d/.test(val),
        spec: /[!@#$%^&*(),.?":{}|<>]/.test(val),
        case: /[a-z]/.test(val) && /[A-Z]/.test(val)
    };
    
    let points = 0;
    Object.keys(tests).forEach(k => {
        const item = document.querySelector(`[data-req="${k}"]`);
        const dot = item.querySelector('.check-dot');
        if (tests[k]) {
            item.classList.add('text-emerald-500');
            dot.classList.add('bg-emerald-500', 'border-emerald-500');
            points++;
        } else {
            item.classList.remove('text-emerald-500');
            dot.classList.remove('bg-emerald-500', 'border-emerald-500');
        }
    });

    const bars = document.querySelectorAll('.bar-seg');
    bars.forEach((b, i) => {
        b.classList.remove('bg-emerald-500', 'bg-amber-500');
        if (points > i) b.classList.add(points <= 2 ? 'bg-amber-500' : 'bg-emerald-500');
    });
});