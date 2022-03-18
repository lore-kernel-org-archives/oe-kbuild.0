Content-Type: multipart/mixed; boundary="===============0361647360784359886=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:bpf/bpf-next/master 170/201] security/integrity/ima/ima_main.c:546:3-9: preceding lock on line 532
Date: Fri, 18 Mar 2022 13:17:57 +0800
Message-ID: <202203181351.S7NOODWo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0361647360784359886==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Roberto Sassu <roberto.sassu@huawei.com>
CC: Alexei Starovoitov <ast@kernel.org>
CC: Mimi Zohar <zohar@linux.ibm.com>

tree:   https://github.com/ammarfaizi2/linux-block bpf/bpf-next/master
head:   ad13baf4569152b00de11949b8c93aaa83c1243f
commit: 280fe8367b0dc45b6ac5e04fad03e16e99540c0c [170/201] ima: Always retu=
rn a file measurement in ima_file_hash()
:::::: branch date: 31 hours ago
:::::: commit date: 7 days ago
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive=
/20220318/202203181351.S7NOODWo-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> security/integrity/ima/ima_main.c:546:3-9: preceding lock on line 532
>> security/integrity/ima/ima_main.c:546:3-9: preceding lock on line 532
   security/integrity/ima/ima_main.c:553:2-8: preceding lock on line 532
   security/integrity/ima/ima_main.c:553:2-8: preceding lock on line 549

vim +546 security/integrity/ima/ima_main.c

8eb988c70e7709 Mimi Zohar     2010-01-20  522  =

280fe8367b0dc4 Roberto Sassu  2022-03-02  523  static int __ima_inode_hash(=
struct inode *inode, struct file *file, char *buf,
280fe8367b0dc4 Roberto Sassu  2022-03-02  524  			    size_t buf_size)
6beea7afcc72b8 Florent Revest 2020-01-13  525  {
280fe8367b0dc4 Roberto Sassu  2022-03-02  526  	struct integrity_iint_cache=
 *iint =3D NULL, tmp_iint;
280fe8367b0dc4 Roberto Sassu  2022-03-02  527  	int rc, hash_algo;
6beea7afcc72b8 Florent Revest 2020-01-13  528  =

280fe8367b0dc4 Roberto Sassu  2022-03-02  529  	if (ima_policy_flag) {
6beea7afcc72b8 Florent Revest 2020-01-13  530  		iint =3D integrity_iint_fi=
nd(inode);
280fe8367b0dc4 Roberto Sassu  2022-03-02  531  		if (iint)
280fe8367b0dc4 Roberto Sassu  2022-03-02 @532  			mutex_lock(&iint->mutex);
280fe8367b0dc4 Roberto Sassu  2022-03-02  533  	}
280fe8367b0dc4 Roberto Sassu  2022-03-02  534  =

280fe8367b0dc4 Roberto Sassu  2022-03-02  535  	if ((!iint || !(iint->flags=
 & IMA_COLLECTED)) && file) {
280fe8367b0dc4 Roberto Sassu  2022-03-02  536  		if (iint)
280fe8367b0dc4 Roberto Sassu  2022-03-02  537  			mutex_unlock(&iint->mutex=
);
280fe8367b0dc4 Roberto Sassu  2022-03-02  538  =

280fe8367b0dc4 Roberto Sassu  2022-03-02  539  		memset(&tmp_iint, 0, sizeo=
f(tmp_iint));
280fe8367b0dc4 Roberto Sassu  2022-03-02  540  		tmp_iint.inode =3D inode;
280fe8367b0dc4 Roberto Sassu  2022-03-02  541  		mutex_init(&tmp_iint.mutex=
);
280fe8367b0dc4 Roberto Sassu  2022-03-02  542  =

280fe8367b0dc4 Roberto Sassu  2022-03-02  543  		rc =3D ima_collect_measure=
ment(&tmp_iint, file, NULL, 0,
280fe8367b0dc4 Roberto Sassu  2022-03-02  544  					     ima_hash_algo, NUL=
L);
280fe8367b0dc4 Roberto Sassu  2022-03-02  545  		if (rc < 0)
6beea7afcc72b8 Florent Revest 2020-01-13 @546  			return -EOPNOTSUPP;
6beea7afcc72b8 Florent Revest 2020-01-13  547  =

280fe8367b0dc4 Roberto Sassu  2022-03-02  548  		iint =3D &tmp_iint;
6beea7afcc72b8 Florent Revest 2020-01-13  549  		mutex_lock(&iint->mutex);
280fe8367b0dc4 Roberto Sassu  2022-03-02  550  	}
280fe8367b0dc4 Roberto Sassu  2022-03-02  551  =

280fe8367b0dc4 Roberto Sassu  2022-03-02  552  	if (!iint)
280fe8367b0dc4 Roberto Sassu  2022-03-02  553  		return -EOPNOTSUPP;
aa662fc04f5b29 KP Singh       2020-09-16  554  =

aa662fc04f5b29 KP Singh       2020-09-16  555  	/*
aa662fc04f5b29 KP Singh       2020-09-16  556  	 * ima_file_hash can be cal=
led when ima_collect_measurement has still
aa662fc04f5b29 KP Singh       2020-09-16  557  	 * not been called, we migh=
t not always have a hash.
aa662fc04f5b29 KP Singh       2020-09-16  558  	 */
aa662fc04f5b29 KP Singh       2020-09-16  559  	if (!iint->ima_hash) {
aa662fc04f5b29 KP Singh       2020-09-16  560  		mutex_unlock(&iint->mutex);
aa662fc04f5b29 KP Singh       2020-09-16  561  		return -EOPNOTSUPP;
aa662fc04f5b29 KP Singh       2020-09-16  562  	}
aa662fc04f5b29 KP Singh       2020-09-16  563  =

6beea7afcc72b8 Florent Revest 2020-01-13  564  	if (buf) {
6beea7afcc72b8 Florent Revest 2020-01-13  565  		size_t copied_size;
6beea7afcc72b8 Florent Revest 2020-01-13  566  =

6beea7afcc72b8 Florent Revest 2020-01-13  567  		copied_size =3D min_t(size=
_t, iint->ima_hash->length, buf_size);
6beea7afcc72b8 Florent Revest 2020-01-13  568  		memcpy(buf, iint->ima_hash=
->digest, copied_size);
6beea7afcc72b8 Florent Revest 2020-01-13  569  	}
6beea7afcc72b8 Florent Revest 2020-01-13  570  	hash_algo =3D iint->ima_has=
h->algo;
6beea7afcc72b8 Florent Revest 2020-01-13  571  	mutex_unlock(&iint->mutex);
6beea7afcc72b8 Florent Revest 2020-01-13  572  =

280fe8367b0dc4 Roberto Sassu  2022-03-02  573  	if (iint =3D=3D &tmp_iint)
280fe8367b0dc4 Roberto Sassu  2022-03-02  574  		kfree(iint->ima_hash);
280fe8367b0dc4 Roberto Sassu  2022-03-02  575  =

6beea7afcc72b8 Florent Revest 2020-01-13  576  	return hash_algo;
6beea7afcc72b8 Florent Revest 2020-01-13  577  }
403319be5de511 KP Singh       2020-11-24  578  =


:::::: The code at line 546 was first introduced by commit
:::::: 6beea7afcc72b86986080ea1d228a42f2000f2a9 ima: add the ability to que=
ry the cached hash of a given file

:::::: TO: Florent Revest <revest@google.com>
:::::: CC: Mimi Zohar <zohar@linux.ibm.com>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0361647360784359886==--

