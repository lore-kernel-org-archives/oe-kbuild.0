Content-Type: multipart/mixed; boundary="===============3572936131887133946=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 6340/7265] kernel/bpf/hashtab.c:1026:65: warning: Parameter 'l_old' can be declared with const [constParameter]
Date: Thu, 28 Apr 2022 10:10:57 +0800
Message-ID: <202204281035.Z7WRzSf0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3572936131887133946==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   f02ac5c95dfd45d2f50ecc68d79177de326c668c
commit: 14a324f6a67ef6a53e04362a70160a47eb8afffa [6340/7265] bpf: Wire up f=
reeing of referenced kptr
:::::: branch date: 20 hours ago
:::::: commit date: 2 days ago
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 14a324f6a67ef6a53e04362a70160a47eb8afffa
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> kernel/bpf/ringbuf.c:370:38: warning: Parameter 'sample' can be declared=
 with const [constParameter]
   static void bpf_ringbuf_commit(void *sample, u64 flags, bool discard)
                                        ^
>> kernel/bpf/lpm_trie.c:437:35: warning: Found suspicious operator ',' [co=
nstStatement]
    struct lpm_trie_node __rcu **trim, **trim2;
                                     ^
>> kernel/bpf/hashtab.c:1026:65: warning: Parameter 'l_old' can be declared=
 with const [constParameter]
   static int check_flags(struct bpf_htab *htab, struct htab_elem *l_old,
                                                                   ^
>> kernel/bpf/hashtab.c:2032:63: warning: Parameter 'v' can be declared wit=
h const [constParameter]
   static void bpf_hash_map_seq_stop(struct seq_file *seq, void *v)
                                                                 ^

vim +/l_old +1026 kernel/bpf/hashtab.c

824bd0ce6c7c43a Alexei Starovoitov 2016-02-01  1025  =

824bd0ce6c7c43a Alexei Starovoitov 2016-02-01 @1026  static int check_flags=
(struct bpf_htab *htab, struct htab_elem *l_old,
824bd0ce6c7c43a Alexei Starovoitov 2016-02-01  1027  		       u64 map_flags)
824bd0ce6c7c43a Alexei Starovoitov 2016-02-01  1028  {
96049f3afd50fe8 Alexei Starovoitov 2019-01-31  1029  	if (l_old && (map_fla=
gs & ~BPF_F_LOCK) =3D=3D BPF_NOEXIST)
824bd0ce6c7c43a Alexei Starovoitov 2016-02-01  1030  		/* elem already exis=
ts */
824bd0ce6c7c43a Alexei Starovoitov 2016-02-01  1031  		return -EEXIST;
824bd0ce6c7c43a Alexei Starovoitov 2016-02-01  1032  =

96049f3afd50fe8 Alexei Starovoitov 2019-01-31  1033  	if (!l_old && (map_fl=
ags & ~BPF_F_LOCK) =3D=3D BPF_EXIST)
824bd0ce6c7c43a Alexei Starovoitov 2016-02-01  1034  		/* elem doesn't exis=
t, cannot update it */
824bd0ce6c7c43a Alexei Starovoitov 2016-02-01  1035  		return -ENOENT;
824bd0ce6c7c43a Alexei Starovoitov 2016-02-01  1036  =

824bd0ce6c7c43a Alexei Starovoitov 2016-02-01  1037  	return 0;
824bd0ce6c7c43a Alexei Starovoitov 2016-02-01  1038  }
824bd0ce6c7c43a Alexei Starovoitov 2016-02-01  1039  =


:::::: The code at line 1026 was first introduced by commit
:::::: 824bd0ce6c7c43a9e1e210abf124958e54d88342 bpf: introduce BPF_MAP_TYPE=
_PERCPU_HASH map

:::::: TO: Alexei Starovoitov <ast@fb.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3572936131887133946==--

