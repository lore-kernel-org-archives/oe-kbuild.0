Content-Type: multipart/mixed; boundary="===============1784047377399243365=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [plbossart-sound:fix/i386-compilation-take2 1/9] sound/soc/sof/control.c:429:2: warning: Assignment of function parameter has no effect outside the function.
Date: Tue, 01 Sep 2020 10:52:16 +0300
Message-ID: <20200901075216.GB8321@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1784047377399243365==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/plbossart/sound  fix/i386-compilation-take2
head:   e6a2ab3ab7a225e087fdc0c4366845df47d8d6e9
commit: 62fbd1b82ef33c8aead59f680a3b7535bdb0c21f [1/9] ASoC: SOF: (cosmetic=
) remove redundant "ret" variable uses
compiler: aarch64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

cppcheck warnings: (new ones prefixed by >>)

>> sound/soc/sof/control.c:429:2: warning: Assignment of function parameter=
 has no effect outside the function. [uselessAssignmentArg]
    size -=3D sizeof(const struct snd_ctl_tlv);
    ^

# https://github.com/plbossart/sound/commit/62fbd1b82ef33c8aead59f680a3b753=
5bdb0c21f =

git remote add plbossart-sound https://github.com/plbossart/sound =

git fetch --no-tags plbossart-sound fix/i386-compilation-take2
git checkout 62fbd1b82ef33c8aead59f680a3b7535bdb0c21f
vim +429 sound/soc/sof/control.c

c3078f53970467 Liam Girdwood     2019-04-12  411  int snd_sof_bytes_ext_get=
(struct snd_kcontrol *kcontrol,
c3078f53970467 Liam Girdwood     2019-04-12  412  			  unsigned int __user =
*binary_data,
c3078f53970467 Liam Girdwood     2019-04-12  413  			  unsigned int size)
c3078f53970467 Liam Girdwood     2019-04-12  414  {
c3078f53970467 Liam Girdwood     2019-04-12  415  	struct soc_bytes_ext *be=
 =3D
c3078f53970467 Liam Girdwood     2019-04-12  416  		(struct soc_bytes_ext *=
)kcontrol->private_value;
c3078f53970467 Liam Girdwood     2019-04-12  417  	struct snd_sof_control *=
scontrol =3D be->dobj.private;
ee1e79b72e3cf5 Ranjani Sridharan 2019-12-04  418  	struct snd_soc_component=
 *scomp =3D scontrol->scomp;
c3078f53970467 Liam Girdwood     2019-04-12  419  	struct sof_ipc_ctrl_data=
 *cdata =3D scontrol->control_data;
c3078f53970467 Liam Girdwood     2019-04-12  420  	struct snd_ctl_tlv heade=
r;
c3078f53970467 Liam Girdwood     2019-04-12  421  	struct snd_ctl_tlv __use=
r *tlvd =3D
c3078f53970467 Liam Girdwood     2019-04-12  422  		(struct snd_ctl_tlv __u=
ser *)binary_data;
c3078f53970467 Liam Girdwood     2019-04-12  423  	int data_size;
c3078f53970467 Liam Girdwood     2019-04-12  424  =

c3078f53970467 Liam Girdwood     2019-04-12  425  	/*
c3078f53970467 Liam Girdwood     2019-04-12  426  	 * Decrement the limit b=
y ext bytes header size to
c3078f53970467 Liam Girdwood     2019-04-12  427  	 * ensure the user space=
 buffer is not exceeded.
c3078f53970467 Liam Girdwood     2019-04-12  428  	 */
c3078f53970467 Liam Girdwood     2019-04-12 @429  	size -=3D sizeof(const s=
truct snd_ctl_tlv);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org =

_______________________________________________
kbuild mailing list -- kbuild(a)lists.01.org
To unsubscribe send an email to kbuild-leave(a)lists.01.org
--===============1784047377399243365==--

