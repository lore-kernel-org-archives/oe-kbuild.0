Content-Type: multipart/mixed; boundary="===============6655489703285900782=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [android-goldfish:android-5.4 8/9] fs/sdcardfs/main.c:174:14: warning: struct member 'sdcardfs_mount_private::dev_name' is never used.
Date: Wed, 03 Jun 2020 14:43:22 +0800
Message-ID: <202006031419.McU3poda%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6655489703285900782==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: "Alistair, Delva," <adelva@google.com>

tree:   https://android.googlesource.com/kernel/goldfish android-5.4
head:   f8aa5f514ccb2ded066fe47f6fd571fe016ca648
commit: ed21d463f856dfad55dc05afd8b7ff3232e9109b [8/9] Revert "ANDROID: sdc=
ardfs: remove sdcardfs from system"
:::::: branch date: 13 hours ago
:::::: commit date: 15 hours ago
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   In file included from fs/sdcardfs/main.c:
>> fs/sdcardfs/main.c:174:14: warning: struct member 'sdcardfs_mount_privat=
e::dev_name' is never used. [unusedStructMember]
    const char *dev_name;
                ^
>> fs/sdcardfs/main.c:175:8: warning: struct member 'sdcardfs_mount_private=
::raw_data' is never used. [unusedStructMember]
    void *raw_data;
          ^
--
>> fs/sdcardfs/lookup.c:54:7: warning: Variable 'info' is reassigned a valu=
e before the old one has been used. [redundantAssignment]
    info =3D kmem_cache_zalloc(sdcardfs_dentry_cachep, GFP_ATOMIC);
         ^
   fs/sdcardfs/lookup.c:51:0: note: Variable 'info' is reassigned a value b=
efore the old one has been used.
    struct sdcardfs_dentry_info *info =3D SDCARDFS_D(dentry);
   ^
   fs/sdcardfs/lookup.c:54:7: note: Variable 'info' is reassigned a value b=
efore the old one has been used.
    info =3D kmem_cache_zalloc(sdcardfs_dentry_cachep, GFP_ATOMIC);
         ^

git remote add android-goldfish https://android.googlesource.com/kernel/gol=
dfish
git remote update android-goldfish
git checkout ed21d463f856dfad55dc05afd8b7ff3232e9109b
vim +174 fs/sdcardfs/main.c

ed21d463f856df Alistair Delva 2020-06-02  171  =

ed21d463f856df Alistair Delva 2020-06-02  172  struct sdcardfs_mount_privat=
e {
ed21d463f856df Alistair Delva 2020-06-02  173  	struct vfsmount *mnt;
ed21d463f856df Alistair Delva 2020-06-02 @174  	const char *dev_name;
ed21d463f856df Alistair Delva 2020-06-02 @175  	void *raw_data;
ed21d463f856df Alistair Delva 2020-06-02  176  };
ed21d463f856df Alistair Delva 2020-06-02  177  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6655489703285900782==--

