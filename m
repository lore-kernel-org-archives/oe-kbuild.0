Content-Type: multipart/mixed; boundary="===============8809499817709524638=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [vfs-idmapping:fs.posix_acl.vfsuid 12/37] fs/cifs/cifsacl.c:1703:9: sparse: sparse: switch with no cases
Date: Sat, 10 Sep 2022 02:59:24 +0800
Message-ID: <202209100250.pDyZkjMF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8809499817709524638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: fs/cifs/c=
ifsacl.c:1703:9: sparse: sparse: switch with no cases"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git f=
s.posix_acl.vfsuid
head:   d37e11d9b40fc35810217121aa3205b7975fd4c6
commit: fa37058424f3ca8becc99200b11a3690537f134e [12/37] cifs: add ->get_de=
ntry_acl() method
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: x86_64-randconfig-s021 (https://download.01.org/0day-ci/archive/202=
20910/202209100250.pDyZkjMF-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git=
/commit/?id=3Dfa37058424f3ca8becc99200b11a3690537f134e
        git remote add vfs-idmapping https://git.kernel.org/pub/scm/linux/k=
ernel/git/vfs/idmapping.git
        git fetch --no-tags vfs-idmapping fs.posix_acl.vfsuid
        git checkout fa37058424f3ca8becc99200b11a3690537f134e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash fs/cifs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> fs/cifs/cifsacl.c:1703:9: sparse: sparse: switch with no cases

vim +1703 fs/cifs/cifsacl.c

fa37058424f3ca Christian Brauner 2022-09-06  1674  =

fa37058424f3ca Christian Brauner 2022-09-06  1675  struct posix_acl *cifs_g=
et_dentry_acl(struct user_namespace *mnt_userns,
fa37058424f3ca Christian Brauner 2022-09-06  1676  				      struct dentry =
*dentry, int type)
fa37058424f3ca Christian Brauner 2022-09-06  1677  {
fa37058424f3ca Christian Brauner 2022-09-06  1678  	struct posix_acl *acl =
=3D NULL;
fa37058424f3ca Christian Brauner 2022-09-06  1679  	ssize_t rc =3D -EOPNOTS=
UPP;
fa37058424f3ca Christian Brauner 2022-09-06  1680  	unsigned int xid;
fa37058424f3ca Christian Brauner 2022-09-06  1681  	struct super_block *sb =
=3D dentry->d_sb;
fa37058424f3ca Christian Brauner 2022-09-06  1682  	struct cifs_sb_info *ci=
fs_sb =3D CIFS_SB(sb);
fa37058424f3ca Christian Brauner 2022-09-06  1683  	struct tcon_link *tlink;
fa37058424f3ca Christian Brauner 2022-09-06  1684  	struct cifs_tcon *pTcon;
fa37058424f3ca Christian Brauner 2022-09-06  1685  	const char *full_path;
fa37058424f3ca Christian Brauner 2022-09-06  1686  	void *page;
fa37058424f3ca Christian Brauner 2022-09-06  1687  =

fa37058424f3ca Christian Brauner 2022-09-06  1688  	tlink =3D cifs_sb_tlink=
(cifs_sb);
fa37058424f3ca Christian Brauner 2022-09-06  1689  	if (IS_ERR(tlink))
fa37058424f3ca Christian Brauner 2022-09-06  1690  		return ERR_CAST(tlink);
fa37058424f3ca Christian Brauner 2022-09-06  1691  	pTcon =3D tlink_tcon(tl=
ink);
fa37058424f3ca Christian Brauner 2022-09-06  1692  =

fa37058424f3ca Christian Brauner 2022-09-06  1693  	xid =3D get_xid();
fa37058424f3ca Christian Brauner 2022-09-06  1694  	page =3D alloc_dentry_p=
ath();
fa37058424f3ca Christian Brauner 2022-09-06  1695  =

fa37058424f3ca Christian Brauner 2022-09-06  1696  	full_path =3D build_pat=
h_from_dentry(dentry, page);
fa37058424f3ca Christian Brauner 2022-09-06  1697  	if (IS_ERR(full_path)) {
fa37058424f3ca Christian Brauner 2022-09-06  1698  		acl =3D ERR_CAST(full_=
path);
fa37058424f3ca Christian Brauner 2022-09-06  1699  		goto out;
fa37058424f3ca Christian Brauner 2022-09-06  1700  	}
fa37058424f3ca Christian Brauner 2022-09-06  1701  =

fa37058424f3ca Christian Brauner 2022-09-06  1702  	/* return alt name if a=
vailable as pseudo attr */
fa37058424f3ca Christian Brauner 2022-09-06 @1703  	switch (type) {

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8809499817709524638==--

