Content-Type: multipart/mixed; boundary="===============8799139979955896516=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mcgrof:modules-testing 29/31] kernel/module/tracking.c:27:18: warning: Uninitialized variable: mod_taint->taints [uninitvar]
Date: Thu, 05 May 2022 14:27:50 +0800
Message-ID: <202205051421.oANVVpqN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8799139979955896516==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Aaron Tomlin <atomlin@redhat.com>
CC: Luis Chamberlain <mcgrof@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git mo=
dules-testing
head:   8b1abdc9007c0cb7976543dcb0f93441a4f05ab1
commit: 442b86c2608f0fb58438b178c1372f6080b87189 [29/31] module: Introduce =
module unload taint tracking
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
compiler: aarch64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 442b86c2608f0fb58438b178c1372f6080b87189
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> kernel/module/tracking.c:27:18: warning: Uninitialized variable: mod_tai=
nt->taints [uninitvar]
         mod_taint->taints & mod->taints) {
                    ^
   kernel/module/tracking.c:55:38: warning: Uninitialized variable: mod_tai=
nt->taints [uninitvar]
      l =3D module_flags_taint(mod_taint->taints, buf);
                                        ^

vim +27 kernel/module/tracking.c

442b86c2608f0f Aaron Tomlin 2022-05-02  17  =

442b86c2608f0f Aaron Tomlin 2022-05-02  18  int try_add_tainted_module(stru=
ct module *mod)
442b86c2608f0f Aaron Tomlin 2022-05-02  19  {
442b86c2608f0f Aaron Tomlin 2022-05-02  20  	struct mod_unload_taint *mod_t=
aint;
442b86c2608f0f Aaron Tomlin 2022-05-02  21  =

442b86c2608f0f Aaron Tomlin 2022-05-02  22  	module_assert_mutex_or_preempt=
();
442b86c2608f0f Aaron Tomlin 2022-05-02  23  =

442b86c2608f0f Aaron Tomlin 2022-05-02  24  	list_for_each_entry_rcu(mod_ta=
int, &unloaded_tainted_modules, list,
442b86c2608f0f Aaron Tomlin 2022-05-02  25  				lockdep_is_held(&module_mut=
ex)) {
442b86c2608f0f Aaron Tomlin 2022-05-02  26  		if (!strcmp(mod_taint->name, =
mod->name) &&
442b86c2608f0f Aaron Tomlin 2022-05-02 @27  		    mod_taint->taints & mod->=
taints) {
442b86c2608f0f Aaron Tomlin 2022-05-02  28  			mod_taint->count++;
442b86c2608f0f Aaron Tomlin 2022-05-02  29  			goto out;
442b86c2608f0f Aaron Tomlin 2022-05-02  30  		}
442b86c2608f0f Aaron Tomlin 2022-05-02  31  	}
442b86c2608f0f Aaron Tomlin 2022-05-02  32  =

442b86c2608f0f Aaron Tomlin 2022-05-02  33  	mod_taint =3D kmalloc(sizeof(*=
mod_taint), GFP_KERNEL);
442b86c2608f0f Aaron Tomlin 2022-05-02  34  	if (unlikely(!mod_taint))
442b86c2608f0f Aaron Tomlin 2022-05-02  35  		return -ENOMEM;
442b86c2608f0f Aaron Tomlin 2022-05-02  36  	strscpy(mod_taint->name, mod->=
name, MODULE_NAME_LEN);
442b86c2608f0f Aaron Tomlin 2022-05-02  37  	mod_taint->taints =3D mod->tai=
nts;
442b86c2608f0f Aaron Tomlin 2022-05-02  38  	list_add_rcu(&mod_taint->list,=
 &unloaded_tainted_modules);
442b86c2608f0f Aaron Tomlin 2022-05-02  39  	mod_taint->count =3D 1;
442b86c2608f0f Aaron Tomlin 2022-05-02  40  out:
442b86c2608f0f Aaron Tomlin 2022-05-02  41  	return 0;
442b86c2608f0f Aaron Tomlin 2022-05-02  42  }
442b86c2608f0f Aaron Tomlin 2022-05-02  43  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8799139979955896516==--

