Content-Type: multipart/mixed; boundary="===============0864440068155646728=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/btrfs/send.c:6858:13: warning: Either the condition '*level==0' is redundant or the array 'path->nodes[8]' is accessed at index -1, which is out of bounds. [negativeIndex]
Date: Mon, 15 Aug 2022 14:52:37 +0800
Message-ID: <202208151453.RpUEb3Sg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0864440068155646728==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: fs/btrfs/=
send.c:6858:13: warning: Either the condition '*level=3D=3D0' is redundant =
or the array 'path->nodes[8]' is accessed at index -1, which is out of boun=
ds. [negativeIndex]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Filipe Manana <fdmanana@suse.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   568035b01cfb107af8d2e4bd2fb9aea22cf5b868
commit: d96b34248c2f4ea8cd09286090f2f6f77102eaab btrfs: make send work with=
 concurrent block group relocation
date:   7 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 7 months ago
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout d96b34248c2f4ea8cd09286090f2f6f77102eaab
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/btrfs/send.c:6858:13: warning: Either the condition '*level=3D=3D0' i=
s redundant or the array 'path->nodes[8]' is accessed at index -1, which is=
 out of bounds. [negativeIndex]
    path->nodes[*level - 1] =3D eb;
               ^
   fs/btrfs/send.c:6862:13: note: Assuming that condition '*level=3D=3D0' i=
s not redundant
    if (*level =3D=3D 0)
               ^
   fs/btrfs/send.c:6858:13: note: Negative array index
    path->nodes[*level - 1] =3D eb;
               ^
>> fs/btrfs/send.c:6859:13: warning: Either the condition '*level=3D=3D0' i=
s redundant or the array 'path->slots[8]' is accessed at index -1, which is=
 out of bounds. [negativeIndex]
    path->slots[*level - 1] =3D 0;
               ^
   fs/btrfs/send.c:6862:13: note: Assuming that condition '*level=3D=3D0' i=
s not redundant
    if (*level =3D=3D 0)
               ^
   fs/btrfs/send.c:6859:13: note: Negative array index
    path->slots[*level - 1] =3D 0;
               ^
   fs/btrfs/send.c:2099:12: warning: Uninitialized variable: cur->ino [unin=
itvar]
     if (cur->ino =3D=3D ino && cur->gen =3D=3D gen)
              ^
   fs/btrfs/send.c:2095:6: note: Assuming condition is false
    if (!nce_head)
        ^
   fs/btrfs/send.c:2099:12: note: Uninitialized variable: cur->ino
     if (cur->ino =3D=3D ino && cur->gen =3D=3D gen)
              ^
   fs/btrfs/send.c:3135:17: warning: Uninitialized variables: cur.list, cur=
.name, cur.full_path, cur.dir, cur.dir_gen, cur.name_len [uninitvar]
     ret =3D dup_ref(cur, &pm->update_refs);
                   ^
   fs/btrfs/send.c:3112:6: note: Assuming condition is false
    if (!pm)
        ^
   fs/btrfs/send.c:3112:6: note: Assuming condition is false
    if (!pm)
        ^
   fs/btrfs/send.c:3112:6: note: Assuming condition is false
    if (!pm)
        ^
   fs/btrfs/send.c:3112:6: note: Assuming condition is false
    if (!pm)
        ^
   fs/btrfs/send.c:3112:6: note: Assuming condition is false
    if (!pm)
        ^
   fs/btrfs/send.c:3112:6: note: Assuming condition is false
    if (!pm)
        ^
   fs/btrfs/send.c:3135:17: note: Uninitialized variables: cur.list, cur.na=
me, cur.full_path, cur.dir, cur.dir_gen, cur.name_len
     ret =3D dup_ref(cur, &pm->update_refs);
                   ^

vim +6858 fs/btrfs/send.c

d96b34248c2f4ea Filipe Manana 2021-11-22  6826  =

2ce73c633573f14 Filipe Manana 2021-03-01  6827  static int tree_move_down(s=
truct btrfs_path *path, int *level, u64 reada_min_gen)
18d0f5c6e16ce76 David Sterba  2019-08-21  6828  {
18d0f5c6e16ce76 David Sterba  2019-08-21  6829  	struct extent_buffer *eb;
2ce73c633573f14 Filipe Manana 2021-03-01  6830  	struct extent_buffer *pare=
nt =3D path->nodes[*level];
2ce73c633573f14 Filipe Manana 2021-03-01  6831  	int slot =3D path->slots[*=
level];
2ce73c633573f14 Filipe Manana 2021-03-01  6832  	const int nritems =3D btrf=
s_header_nritems(parent);
2ce73c633573f14 Filipe Manana 2021-03-01  6833  	u64 reada_max;
2ce73c633573f14 Filipe Manana 2021-03-01  6834  	u64 reada_done =3D 0;
18d0f5c6e16ce76 David Sterba  2019-08-21  6835  =

d96b34248c2f4ea Filipe Manana 2021-11-22  6836  	lockdep_assert_held_read(&=
parent->fs_info->commit_root_sem);
d96b34248c2f4ea Filipe Manana 2021-11-22  6837  =

18d0f5c6e16ce76 David Sterba  2019-08-21  6838  	BUG_ON(*level =3D=3D 0);
2ce73c633573f14 Filipe Manana 2021-03-01  6839  	eb =3D btrfs_read_node_slo=
t(parent, slot);
18d0f5c6e16ce76 David Sterba  2019-08-21  6840  	if (IS_ERR(eb))
18d0f5c6e16ce76 David Sterba  2019-08-21  6841  		return PTR_ERR(eb);
18d0f5c6e16ce76 David Sterba  2019-08-21  6842  =

2ce73c633573f14 Filipe Manana 2021-03-01  6843  	/*
2ce73c633573f14 Filipe Manana 2021-03-01  6844  	 * Trigger readahead for t=
he next leaves we will process, so that it is
2ce73c633573f14 Filipe Manana 2021-03-01  6845  	 * very likely that when w=
e need them they are already in memory and we
2ce73c633573f14 Filipe Manana 2021-03-01  6846  	 * will not block on disk =
IO. For nodes we only do readahead for one,
2ce73c633573f14 Filipe Manana 2021-03-01  6847  	 * since the time window b=
etween processing nodes is typically larger.
2ce73c633573f14 Filipe Manana 2021-03-01  6848  	 */
2ce73c633573f14 Filipe Manana 2021-03-01  6849  	reada_max =3D (*level =3D=
=3D 1 ? SZ_128K : eb->fs_info->nodesize);
2ce73c633573f14 Filipe Manana 2021-03-01  6850  =

2ce73c633573f14 Filipe Manana 2021-03-01  6851  	for (slot++; slot < nritem=
s && reada_done < reada_max; slot++) {
2ce73c633573f14 Filipe Manana 2021-03-01  6852  		if (btrfs_node_ptr_genera=
tion(parent, slot) > reada_min_gen) {
2ce73c633573f14 Filipe Manana 2021-03-01  6853  			btrfs_readahead_node_chi=
ld(parent, slot);
2ce73c633573f14 Filipe Manana 2021-03-01  6854  			reada_done +=3D eb->fs_i=
nfo->nodesize;
2ce73c633573f14 Filipe Manana 2021-03-01  6855  		}
2ce73c633573f14 Filipe Manana 2021-03-01  6856  	}
2ce73c633573f14 Filipe Manana 2021-03-01  6857  =

18d0f5c6e16ce76 David Sterba  2019-08-21 @6858  	path->nodes[*level - 1] =
=3D eb;
18d0f5c6e16ce76 David Sterba  2019-08-21 @6859  	path->slots[*level - 1] =
=3D 0;
18d0f5c6e16ce76 David Sterba  2019-08-21  6860  	(*level)--;
d96b34248c2f4ea Filipe Manana 2021-11-22  6861  =

d96b34248c2f4ea Filipe Manana 2021-11-22  6862  	if (*level =3D=3D 0)
d96b34248c2f4ea Filipe Manana 2021-11-22  6863  		return replace_node_with_=
clone(path, 0);
d96b34248c2f4ea Filipe Manana 2021-11-22  6864  =

18d0f5c6e16ce76 David Sterba  2019-08-21  6865  	return 0;
18d0f5c6e16ce76 David Sterba  2019-08-21  6866  }
18d0f5c6e16ce76 David Sterba  2019-08-21  6867  =


:::::: The code at line 6858 was first introduced by commit
:::::: 18d0f5c6e16ce762f92ab7879c30ff2e37cd9cef btrfs: move functions for t=
ree compare to send.c

:::::: TO: David Sterba <dsterba@suse.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0864440068155646728==--

