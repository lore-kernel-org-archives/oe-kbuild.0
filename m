Content-Type: multipart/mixed; boundary="===============0376469403825700558=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [dhowells-fs:afs-operation /17] fs/afs/super.c:539:61: sparse: expected struct afs_server_list *
Date: Tue, 28 Apr 2020 07:44:52 +0800
Message-ID: <202004280747.g9YfdY4z%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0376469403825700558==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.g=
it afs-operation
head:   71607840c8097c9f8cd0dcada9c96a1500ce7837
commit: e54a7a021c8c23c3eaca54c7b60f99263eeec267 [/17] afs: Detect cell ali=
ases 1 - Cells with root volumes
reproduce:
        # apt-get install sparse
        # sparse version: =

        git checkout e54a7a021c8c23c3eaca54c7b60f99263eeec267
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 31 minutes ago
:::::: commit date: 3 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   fs/afs/rotate.c:28:56: sparse: warning: incorrect type in argument 1 (di=
fferent address spaces)
>> fs/afs/rotate.c:28:56: sparse:    expected struct afs_server_list *slist
>> fs/afs/rotate.c:28:56: sparse:    got struct afs_server_list [noderef] <=
asn:4> *servers
   fs/afs/rotate.c:176:49: sparse: error: incompatible types in comparison =
expression (different address spaces):
>> fs/afs/rotate.c:176:49: sparse:    struct afs_server_list [noderef] <asn=
:4> *
>> fs/afs/rotate.c:176:49: sparse:    struct afs_server_list *
   fs/afs/rotate.c:266:49: sparse: error: incompatible types in comparison =
expression (different address spaces):
   fs/afs/rotate.c:266:49: sparse:    struct afs_server_list [noderef] <asn=
:4> *
   fs/afs/rotate.c:266:49: sparse:    struct afs_server_list *
--
   fs/afs/super.c:539:61: sparse: warning: incorrect type in argument 2 (di=
fferent address spaces)
>> fs/afs/super.c:539:61: sparse:    expected struct afs_server_list *
>> fs/afs/super.c:539:61: sparse:    got struct afs_server_list [noderef] <=
asn:4> *servers
--
   fs/afs/volume.c:12:24: sparse: warning: symbol 'afs_volume_gc_delay' was=
 not declared. Should it be static?
   fs/afs/volume.c:13:24: sparse: warning: symbol 'afs_volume_record_life' =
was not declared. Should it be static?
   fs/afs/volume.c:159:39: sparse: warning: incorrect type in argument 2 (d=
ifferent address spaces)
>> fs/afs/volume.c:159:39: sparse:    expected struct afs_server_list *
>> fs/afs/volume.c:159:39: sparse:    got struct afs_server_list [noderef] =
<asn:4> *servers

# https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/com=
mit/?id=3De54a7a021c8c23c3eaca54c7b60f99263eeec267
git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/=
dhowells/linux-fs.git
git remote update dhowells-fs
git checkout e54a7a021c8c23c3eaca54c7b60f99263eeec267
vim +539 fs/afs/super.c

49566f6f06b38d David Howells 2017-11-02  526  =

0da0b7fd73e4f2 David Howells 2018-06-15  527  static void afs_kill_super(st=
ruct super_block *sb)
0da0b7fd73e4f2 David Howells 2018-06-15  528  {
0da0b7fd73e4f2 David Howells 2018-06-15  529  	struct afs_super_info *as =
=3D AFS_FS_S(sb);
0da0b7fd73e4f2 David Howells 2018-06-15  530  	struct afs_net *net =3D afs_=
net(as->net_ns);
0da0b7fd73e4f2 David Howells 2018-06-15  531  =

0da0b7fd73e4f2 David Howells 2018-06-15  532  	if (as->dyn_root)
0da0b7fd73e4f2 David Howells 2018-06-15  533  		afs_dynroot_depopulate(sb);
0da0b7fd73e4f2 David Howells 2018-06-15  534  =

0da0b7fd73e4f2 David Howells 2018-06-15  535  	/* Clear the callback intere=
sts (which will do ilookup5) before
0da0b7fd73e4f2 David Howells 2018-06-15  536  	 * deactivating the superblo=
ck.
0da0b7fd73e4f2 David Howells 2018-06-15  537  	 */
0da0b7fd73e4f2 David Howells 2018-06-15  538  	if (as->volume)
0da0b7fd73e4f2 David Howells 2018-06-15 @539  		afs_clear_callback_interest=
s(net, as->volume->servers);
0da0b7fd73e4f2 David Howells 2018-06-15  540  	kill_anon_super(sb);
0da0b7fd73e4f2 David Howells 2018-06-15  541  	if (as->volume)
0da0b7fd73e4f2 David Howells 2018-06-15  542  		afs_deactivate_volume(as->v=
olume);
0da0b7fd73e4f2 David Howells 2018-06-15  543  	afs_destroy_sbi(as);
0da0b7fd73e4f2 David Howells 2018-06-15  544  }
0da0b7fd73e4f2 David Howells 2018-06-15  545  =


:::::: The code at line 539 was first introduced by commit
:::::: 0da0b7fd73e4f20e1a987dfade0b36bb4813cf10 afs: Display manually added=
 cells in dynamic root mount

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0376469403825700558==--

