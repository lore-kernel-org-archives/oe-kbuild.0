Content-Type: multipart/mixed; boundary="===============5465259543279668537=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:dhowells/linux-fs/rxrpc-ringless 9/35] fs/seq_file.c:938:9: sparse: struct list_head [noderef] __rcu *
Date: Fri, 13 May 2022 11:28:31 +0800
Message-ID: <202205131113.n0w2zU84-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5465259543279668537==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/rxrpc-=
ringless
head:   36075641f704b02b4bcaee01d904a06676b32199
commit: 6a29f9d2770a0ff29c137936a8ad8ce3e83e39c3 [9/35] rxrpc: Fix locking =
issue
:::::: branch date: 11 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-s001 (https://download.01.org/0day-ci/archive/20220=
513/202205131113.n0w2zU84-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/ammarfaizi2/linux-block/commit/6a29f9d2770a0ff=
29c137936a8ad8ce3e83e39c3
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/rxrpc-ringl=
ess
        git checkout 6a29f9d2770a0ff29c137936a8ad8ce3e83e39c3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Di386 SHELL=3D/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   fs/seq_file.c:938:9: sparse: sparse: incompatible types in comparison ex=
pression (different address spaces):
>> fs/seq_file.c:938:9: sparse:    struct list_head [noderef] __rcu *
>> fs/seq_file.c:938:9: sparse:    struct list_head *
   fs/seq_file.c:938:9: sparse: sparse: incompatible types in comparison ex=
pression (different address spaces):
>> fs/seq_file.c:938:9: sparse:    struct list_head [noderef] __rcu *
>> fs/seq_file.c:938:9: sparse:    struct list_head *
   fs/seq_file.c:960:14: sparse: sparse: incompatible types in comparison e=
xpression (different address spaces):
   fs/seq_file.c:960:14: sparse:    struct list_head [noderef] __rcu *
   fs/seq_file.c:960:14: sparse:    struct list_head *
   fs/seq_file.c:1087:24: sparse: sparse: incompatible types in comparison =
expression (different address spaces):
   fs/seq_file.c:1087:24: sparse:    struct hlist_node [noderef] __rcu *
   fs/seq_file.c:1087:24: sparse:    struct hlist_node *
   fs/seq_file.c:1089:24: sparse: sparse: incompatible types in comparison =
expression (different address spaces):
   fs/seq_file.c:1089:24: sparse:    struct hlist_node [noderef] __rcu *
   fs/seq_file.c:1089:24: sparse:    struct hlist_node *

vim +938 fs/seq_file.c

66655de6d132b7 Li Zefan      2010-02-08  933  =

6a29f9d2770a0f David Howells 2022-05-10  934  struct list_head *seq_list_st=
art_rcu(struct list_head *head, loff_t pos)
6a29f9d2770a0f David Howells 2022-05-10  935  {
6a29f9d2770a0f David Howells 2022-05-10  936  	struct list_head *lh;
6a29f9d2770a0f David Howells 2022-05-10  937  =

6a29f9d2770a0f David Howells 2022-05-10 @938  	list_for_each_rcu(lh, head)
6a29f9d2770a0f David Howells 2022-05-10  939  		if (pos-- =3D=3D 0)
6a29f9d2770a0f David Howells 2022-05-10  940  			return lh;
6a29f9d2770a0f David Howells 2022-05-10  941  =

6a29f9d2770a0f David Howells 2022-05-10  942  	return NULL;
6a29f9d2770a0f David Howells 2022-05-10  943  }
6a29f9d2770a0f David Howells 2022-05-10  944  EXPORT_SYMBOL(seq_list_start_=
rcu);
6a29f9d2770a0f David Howells 2022-05-10  945  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5465259543279668537==--

