Content-Type: multipart/mixed; boundary="===============4514360100452408328=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/msm/msm_gem_submit.c:100:32: warning: Local variable submit_bo shadows outer function [shadowFunction]
Date: Fri, 04 Feb 2022 09:29:15 +0800
Message-ID: <202202040246.lzRuQlpF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4514360100452408328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: Rob Clark <robdclark@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   88808fbbead481aedb46640a5ace69c58287f56a
commit: b3ed524f84f573ece1aa2f26e9db3c34a593e0d1 drm/msm: allow compile_tes=
t on !ARM
date:   4 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 4 months ago
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/msm/msm_gem_submit.c:100:32: warning: Local variable sub=
mit_bo shadows outer function [shadowFunction]
     struct drm_msm_gem_submit_bo submit_bo;
                                  ^
   drivers/gpu/drm/msm/msm_gem_submit.c:405:12: note: Shadowed declaration
   static int submit_bo(struct msm_gem_submit *submit, uint32_t idx,
              ^
   drivers/gpu/drm/msm/msm_gem_submit.c:100:32: note: Shadow variable
     struct drm_msm_gem_submit_bo submit_bo;
                                  ^
>> drivers/gpu/drm/msm/msm_gem_submit.c:452:35: warning: Local variable sub=
mit_reloc shadows outer function [shadowFunction]
     struct drm_msm_gem_submit_reloc submit_reloc =3D relocs[i];
                                     ^
   drivers/gpu/drm/msm/msm_gem_submit.c:425:12: note: Shadowed declaration
   static int submit_reloc(struct msm_gem_submit *submit, struct msm_gem_ob=
ject *obj,
              ^
   drivers/gpu/drm/msm/msm_gem_submit.c:452:35: note: Shadow variable
     struct drm_msm_gem_submit_reloc submit_reloc =3D relocs[i];
                                     ^

vim +100 drivers/gpu/drm/msm/msm_gem_submit.c

40e6815bba6e34e Rob Clark              2016-05-03   92  =

7198e6b03155f6d Rob Clark              2013-07-19   93  static int submit_l=
ookup_objects(struct msm_gem_submit *submit,
7198e6b03155f6d Rob Clark              2013-07-19   94  		struct drm_msm_ge=
m_submit *args, struct drm_file *file)
7198e6b03155f6d Rob Clark              2013-07-19   95  {
7198e6b03155f6d Rob Clark              2013-07-19   96  	unsigned i;
7198e6b03155f6d Rob Clark              2013-07-19   97  	int ret =3D 0;
7198e6b03155f6d Rob Clark              2013-07-19   98  =

7198e6b03155f6d Rob Clark              2013-07-19   99  	for (i =3D 0; i < =
args->nr_bos; i++) {
7198e6b03155f6d Rob Clark              2013-07-19 @100  		struct drm_msm_ge=
m_submit_bo submit_bo;
7198e6b03155f6d Rob Clark              2013-07-19  101  		void __user *user=
ptr =3D
3ed605bc8a0a688 Gustavo Padovan        2016-04-26  102  			u64_to_user_ptr(=
args->bos + (i * sizeof(submit_bo)));
7198e6b03155f6d Rob Clark              2013-07-19  103  =

a9e26cab40ecfd4 Rob Clark              2016-06-01  104  		/* make sure we d=
on't have garbage flags, in case we hit
a9e26cab40ecfd4 Rob Clark              2016-06-01  105  		 * error path bef=
ore flags is initialized:
a9e26cab40ecfd4 Rob Clark              2016-06-01  106  		 */
a9e26cab40ecfd4 Rob Clark              2016-06-01  107  		submit->bos[i].fl=
ags =3D 0;
a9e26cab40ecfd4 Rob Clark              2016-06-01  108  =

21c42da18ef128c Dan Carpenter          2017-01-16  109  		if (copy_from_use=
r(&submit_bo, userptr, sizeof(submit_bo))) {
21c42da18ef128c Dan Carpenter          2017-01-16  110  			ret =3D -EFAULT;
b673499ae738e77 Kristian H. Kristensen 2019-03-20  111  			i =3D 0;
89f82cbb0d5c0ab Rob Clark              2016-08-22  112  			goto out;
21c42da18ef128c Dan Carpenter          2017-01-16  113  		}
7198e6b03155f6d Rob Clark              2013-07-19  114  =


:::::: The code at line 100 was first introduced by commit
:::::: 7198e6b03155f6dadecadba004eb83b81a6ffe4c drm/msm: add a3xx gpu suppo=
rt

:::::: TO: Rob Clark <robdclark@gmail.com>
:::::: CC: Rob Clark <robdclark@gmail.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4514360100452408328==--

