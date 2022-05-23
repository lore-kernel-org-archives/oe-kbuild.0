Content-Type: multipart/mixed; boundary="===============6890393519550381565=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [net-next:master 21/56] fs/seq_file.c:938:9: sparse: struct list_head [noderef] __rcu *
Date: Mon, 23 May 2022 21:07:04 +0800
Message-ID: <202205232140.tnBP3KBS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6890393519550381565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: netdev(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
master
head:   682a8c633fc32933a73fd0379c62d37d1346055d
commit: ad25f5cb39872ca14bcbe00816ae65c22fe04b89 [21/56] rxrpc: Fix locking=
 issue
:::::: branch date: 3 hours ago
:::::: commit date: 17 hours ago
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20220=
523/202205232140.tnBP3KBS-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.gi=
t/commit/?id=3Dad25f5cb39872ca14bcbe00816ae65c22fe04b89
        git remote add net-next https://git.kernel.org/pub/scm/linux/kernel=
/git/davem/net-next.git
        git fetch --no-tags net-next master
        git checkout ad25f5cb39872ca14bcbe00816ae65c22fe04b89
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Di386 SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
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
>> fs/seq_file.c:960:12: sparse: sparse: incorrect type in assignment (diff=
erent address spaces) @@     expected struct list_head *lh @@     got struc=
t list_head [noderef] __rcu * @@
   fs/seq_file.c:960:12: sparse:     expected struct list_head *lh
   fs/seq_file.c:960:12: sparse:     got struct list_head [noderef] __rcu *
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

ad25f5cb39872c David Howells 2022-05-21  934  struct list_head *seq_list_st=
art_rcu(struct list_head *head, loff_t pos)
ad25f5cb39872c David Howells 2022-05-21  935  {
ad25f5cb39872c David Howells 2022-05-21  936  	struct list_head *lh;
ad25f5cb39872c David Howells 2022-05-21  937  =

ad25f5cb39872c David Howells 2022-05-21 @938  	list_for_each_rcu(lh, head)
ad25f5cb39872c David Howells 2022-05-21  939  		if (pos-- =3D=3D 0)
ad25f5cb39872c David Howells 2022-05-21  940  			return lh;
ad25f5cb39872c David Howells 2022-05-21  941  =

ad25f5cb39872c David Howells 2022-05-21  942  	return NULL;
ad25f5cb39872c David Howells 2022-05-21  943  }
ad25f5cb39872c David Howells 2022-05-21  944  EXPORT_SYMBOL(seq_list_start_=
rcu);
ad25f5cb39872c David Howells 2022-05-21  945  =

ad25f5cb39872c David Howells 2022-05-21  946  struct list_head *seq_list_st=
art_head_rcu(struct list_head *head, loff_t pos)
ad25f5cb39872c David Howells 2022-05-21  947  {
ad25f5cb39872c David Howells 2022-05-21  948  	if (!pos)
ad25f5cb39872c David Howells 2022-05-21  949  		return head;
ad25f5cb39872c David Howells 2022-05-21  950  =

ad25f5cb39872c David Howells 2022-05-21  951  	return seq_list_start_rcu(he=
ad, pos - 1);
ad25f5cb39872c David Howells 2022-05-21  952  }
ad25f5cb39872c David Howells 2022-05-21  953  EXPORT_SYMBOL(seq_list_start_=
head_rcu);
ad25f5cb39872c David Howells 2022-05-21  954  =

ad25f5cb39872c David Howells 2022-05-21  955  struct list_head *seq_list_ne=
xt_rcu(void *v, struct list_head *head,
ad25f5cb39872c David Howells 2022-05-21  956  				    loff_t *ppos)
ad25f5cb39872c David Howells 2022-05-21  957  {
ad25f5cb39872c David Howells 2022-05-21  958  	struct list_head *lh;
ad25f5cb39872c David Howells 2022-05-21  959  =

ad25f5cb39872c David Howells 2022-05-21 @960  	lh =3D list_next_rcu((struct=
 list_head *)v);
ad25f5cb39872c David Howells 2022-05-21  961  	++*ppos;
ad25f5cb39872c David Howells 2022-05-21  962  	return lh =3D=3D head ? NULL=
 : lh;
ad25f5cb39872c David Howells 2022-05-21  963  }
ad25f5cb39872c David Howells 2022-05-21  964  EXPORT_SYMBOL(seq_list_next_r=
cu);
ad25f5cb39872c David Howells 2022-05-21  965  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6890393519550381565==--

