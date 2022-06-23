Content-Type: multipart/mixed; boundary="===============6182889194048296982=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v36 18/33] LSM: Use lsmcontext in security_dentry_init_security
Date: Thu, 23 Jun 2022 08:36:17 +0800
Message-ID: <202206230827.rGKbTxmu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6182889194048296982==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220609230146.319210-19-casey@schaufler-ca.com>
References: <20220609230146.319210-19-casey@schaufler-ca.com>
TO: Casey Schaufler <casey@schaufler-ca.com>
TO: casey.schaufler(a)intel.com
TO: jmorris(a)namei.org
TO: linux-security-module(a)vger.kernel.org
TO: selinux(a)vger.kernel.org
CC: casey(a)schaufler-ca.com
CC: linux-audit(a)redhat.com
CC: keescook(a)chromium.org
CC: john.johansen(a)canonical.com
CC: penguin-kernel(a)i-love.sakura.ne.jp
CC: paul(a)paul-moore.com
CC: stephen.smalley.work(a)gmail.com
CC: linux-kernel(a)vger.kernel.org

Hi Casey,

I love your patch! Perhaps something to improve:

[auto build test WARNING on pcmoore-audit/next]
[also build test WARNING on pcmoore-selinux/next linus/master v5.19-rc3 nex=
t-20220622]
[cannot apply to jmorris-security/next-testing]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Casey-Schaufler/inte=
grity-disassociate-ima_filter_rule-from-security_audit_rule/20220610-080129
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git n=
ext
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: parisc-randconfig-m031-20220622 (https://download.01.org/0day-ci/ar=
chive/20220623/202206230827.rGKbTxmu-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/fuse/dir.c:484 get_security_context() error: uninitialized symbol 'name'.

Old smatch warnings:
fs/fuse/dir.c:503 get_security_context() warn: is 'ptr' large enough for 's=
truct fuse_secctx'? 0

vim +/name +484 fs/fuse/dir.c

e5e5558e923f35 Miklos Szeredi  2005-09-09  461  =

3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  462  static int get_security_con=
text(struct dentry *entry, umode_t mode,
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  463  				void **security_ctx, u3=
2 *security_ctxlen)
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  464  {
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  465  	struct fuse_secctx *fctx;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  466  	struct fuse_secctx_header =
*header;
86d33e271bed73 Casey Schaufler 2022-06-09  467  	struct lsmcontext lsmctx;
86d33e271bed73 Casey Schaufler 2022-06-09  468  	void *ptr;
86d33e271bed73 Casey Schaufler 2022-06-09  469  	u32 total_len =3D sizeof(*=
header);
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  470  	int err, nr_ctx =3D 0;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  471  	const char *name;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  472  	size_t namelen;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  473  =

3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  474  	err =3D security_dentry_in=
it_security(entry, mode, &entry->d_name,
86d33e271bed73 Casey Schaufler 2022-06-09  475  					    &name, &lsmctx);
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  476  	if (err) {
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  477  		if (err !=3D -EOPNOTSUPP)
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  478  			goto out_err;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  479  		/* No LSM is supporting t=
his security hook. Ignore error */
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  480  	}
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  481  =

86d33e271bed73 Casey Schaufler 2022-06-09  482  	if (lsmctx.len) {
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  483  		nr_ctx =3D 1;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11 @484  		namelen =3D strlen(name) =
+ 1;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  485  		err =3D -EIO;
86d33e271bed73 Casey Schaufler 2022-06-09  486  		if (WARN_ON(namelen > XAT=
TR_NAME_MAX + 1 ||
86d33e271bed73 Casey Schaufler 2022-06-09  487  		    lsmctx.len > S32_MAX))
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  488  			goto out_err;
86d33e271bed73 Casey Schaufler 2022-06-09  489  		total_len +=3D FUSE_REC_A=
LIGN(sizeof(*fctx) + namelen +
86d33e271bed73 Casey Schaufler 2022-06-09  490  					    lsmctx.len);
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  491  	}
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  492  =

3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  493  	err =3D -ENOMEM;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  494  	header =3D ptr =3D kzalloc=
(total_len, GFP_KERNEL);
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  495  	if (!ptr)
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  496  		goto out_err;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  497  =

3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  498  	header->nr_secctx =3D nr_c=
tx;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  499  	header->size =3D total_len;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  500  	ptr +=3D sizeof(*header);
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  501  	if (nr_ctx) {
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  502  		fctx =3D ptr;
86d33e271bed73 Casey Schaufler 2022-06-09  503  		fctx->size =3D lsmctx.len;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  504  		ptr +=3D sizeof(*fctx);
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  505  =

3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  506  		strcpy(ptr, name);
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  507  		ptr +=3D namelen;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  508  =

86d33e271bed73 Casey Schaufler 2022-06-09  509  		memcpy(ptr, lsmctx.contex=
t, lsmctx.len);
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  510  	}
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  511  	*security_ctxlen =3D total=
_len;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  512  	*security_ctx =3D header;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  513  	err =3D 0;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  514  out_err:
86d33e271bed73 Casey Schaufler 2022-06-09  515  	if (nr_ctx)
86d33e271bed73 Casey Schaufler 2022-06-09  516  		security_release_secctx(&=
lsmctx);
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  517  	return err;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  518  }
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  519  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6182889194048296982==--

