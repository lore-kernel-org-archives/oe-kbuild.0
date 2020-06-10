Content-Type: multipart/mixed; boundary="===============1472621894169562805=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [android-common:android-mainline 2/9] fs/incfs/integrity.c:196:28: warning: Either the condition '!alg' is redundant or there is possible null pointer dereference: alg.
Date: Wed, 10 Jun 2020 08:30:05 +0800
Message-ID: <202006100800.oFzORUML%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1472621894169562805==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   7760dae8e0ba098c847337476166747560adc5fb
commit: c6819dd77861f22858a4371f755c7d5422920eeb [2/9] ANDROID: Initial com=
mit of Incremental FS
:::::: branch date: 4 months ago
:::::: commit date: 4 months ago
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> fs/incfs/integrity.c:196:28: warning: Either the condition '!alg' is red=
undant or there is possible null pointer dereference: alg. [nullPointerRedu=
ndantCheck]
    SHASH_DESC_ON_STACK(desc, alg->shash);
                              ^
   fs/incfs/integrity.c:198:6: note: Assuming that condition '!alg' is not =
redundant
    if (!alg || !alg->shash || !data.data || !digest.data)
        ^
   fs/incfs/integrity.c:196:28: note: Null pointer dereference
    SHASH_DESC_ON_STACK(desc, alg->shash);
                              ^

git remote add android-common https://android.googlesource.com/kernel/common
git remote update android-common
git checkout c6819dd77861f22858a4371f755c7d5422920eeb
vim +196 fs/incfs/integrity.c

c6819dd77861f2 Eugene Zemtsov 2019-11-18  192  =

c6819dd77861f2 Eugene Zemtsov 2019-11-18  193  int incfs_calc_digest(struct=
 incfs_hash_alg *alg, struct mem_range data,
c6819dd77861f2 Eugene Zemtsov 2019-11-18  194  			struct mem_range digest)
c6819dd77861f2 Eugene Zemtsov 2019-11-18  195  {
c6819dd77861f2 Eugene Zemtsov 2019-11-18 @196  	SHASH_DESC_ON_STACK(desc, a=
lg->shash);
c6819dd77861f2 Eugene Zemtsov 2019-11-18  197  =

c6819dd77861f2 Eugene Zemtsov 2019-11-18  198  	if (!alg || !alg->shash || =
!data.data || !digest.data)
c6819dd77861f2 Eugene Zemtsov 2019-11-18  199  		return -EFAULT;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  200  =

c6819dd77861f2 Eugene Zemtsov 2019-11-18  201  	if (alg->digest_size > dige=
st.len)
c6819dd77861f2 Eugene Zemtsov 2019-11-18  202  		return -EINVAL;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  203  =

c6819dd77861f2 Eugene Zemtsov 2019-11-18  204  	desc->tfm =3D alg->shash;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  205  	return crypto_shash_digest(=
desc, data.data, data.len, digest.data);
c6819dd77861f2 Eugene Zemtsov 2019-11-18  206  }
c6819dd77861f2 Eugene Zemtsov 2019-11-18  207  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1472621894169562805==--

