Content-Type: multipart/mixed; boundary="===============3316362470054749030=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rhvgoyal:ioannis-fanotify 5/18] fs/fuse/virtio_fs.c:840:17: sparse: sparse: no generic selection for 'unsigned int virtio_cread_v'
Date: Sat, 30 Apr 2022 08:26:51 +0800
Message-ID: <202204300830.Wfrx0dmA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3316362470054749030==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Vivek Goyal <vgoyal@redhat.com>
CC: Ioannis Angelakopoulos <iangelak@redhat.com>

tree:   https://github.com/rhvgoyal/linux ioannis-fanotify
head:   10887e7003a6a801e521d59daff76f0c035f061f
commit: ad41fe942800c2d5be17b017c9f75eb44fc692a5 [5/18] virtiofs: Add a vir=
tqueue for notifications
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: ia64-randconfig-s032-20220428 (https://download.01.org/0day-ci/arch=
ive/20220430/202204300830.Wfrx0dmA-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/rhvgoyal/linux/commit/ad41fe942800c2d5be17b017=
c9f75eb44fc692a5
        git remote add rhvgoyal https://github.com/rhvgoyal/linux
        git fetch --no-tags rhvgoyal ioannis-fanotify
        git checkout ad41fe942800c2d5be17b017c9f75eb44fc692a5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Di=
a64 SHELL=3D/bin/bash fs/fuse/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> fs/fuse/virtio_fs.c:840:17: sparse: sparse: no generic selection for 'un=
signed int virtio_cread_v'
>> fs/fuse/virtio_fs.c:840:17: sparse: sparse: incompatible types in compar=
ison expression (different base types):
>> fs/fuse/virtio_fs.c:840:17: sparse:    bad type *
>> fs/fuse/virtio_fs.c:840:17: sparse:    unsigned int *
>> fs/fuse/virtio_fs.c:840:17: sparse: sparse: no generic selection for 'un=
signed int [addressable] virtio_cread_v'

vim +840 fs/fuse/virtio_fs.c

b43b7e81eb2b188 Vivek Goyal        2020-08-19  822  =

a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  823  /* Initialize virtqueue=
s */
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  824  static int virtio_fs_se=
tup_vqs(struct virtio_device *vdev,
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  825  			       struct virtio=
_fs *fs)
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  826  {
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  827  	struct virtqueue **vqs;
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  828  	vq_callback_t **callba=
cks;
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  829  	const char **names;
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  830  	unsigned int i;
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  831  	int ret =3D 0;
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  832  =

2c0349ec1a8ee6f Michael S. Tsirkin 2020-08-05  833  	virtio_cread_le(vdev, =
struct virtio_fs_config, num_request_queues,
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  834  			&fs->num_request_que=
ues);
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  835  	if (fs->num_request_qu=
eues =3D=3D 0)
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  836  		return -EINVAL;
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  837  =

ad41fe942800c2d Vivek Goyal        2021-09-30  838  	if (virtio_has_feature=
(vdev, VIRTIO_FS_F_NOTIFICATION)) {
ad41fe942800c2d Vivek Goyal        2021-09-30  839  		fs->notify_enabled =
=3D true;
ad41fe942800c2d Vivek Goyal        2021-09-30 @840  		virtio_cread(vdev, st=
ruct virtio_fs_config, notify_buf_size,
ad41fe942800c2d Vivek Goyal        2021-09-30  841  			     &fs->notify_buf=
_size);
ad41fe942800c2d Vivek Goyal        2021-09-30  842  		if (fs->notify_buf_si=
ze <=3D sizeof(struct fuse_out_header)) {
ad41fe942800c2d Vivek Goyal        2021-09-30  843  			pr_err("virtio-fs: I=
nvalid value %d of notification buffer size\n",
ad41fe942800c2d Vivek Goyal        2021-09-30  844  			       fs->notify_bu=
f_size);
ad41fe942800c2d Vivek Goyal        2021-09-30  845  			return -EINVAL;
ad41fe942800c2d Vivek Goyal        2021-09-30  846  		}
ad41fe942800c2d Vivek Goyal        2021-09-30  847  		pr_info("virtio-fs: d=
evice supports notification. Notification_buf_size=3D%u\n",
ad41fe942800c2d Vivek Goyal        2021-09-30  848  			fs->notify_buf_size);
ad41fe942800c2d Vivek Goyal        2021-09-30  849  	}
ad41fe942800c2d Vivek Goyal        2021-09-30  850  =

ad41fe942800c2d Vivek Goyal        2021-09-30  851  	if (fs->notify_enabled=
) {
ad41fe942800c2d Vivek Goyal        2021-09-30  852  		/* One additional que=
ue for hiprio and one for notifications */
ad41fe942800c2d Vivek Goyal        2021-09-30  853  		fs->nvqs =3D 2 + fs->=
num_request_queues;
ad41fe942800c2d Vivek Goyal        2021-09-30  854  		fs->first_reqq_idx =
=3D VQ_NOTIFY_IDX + 1;
ad41fe942800c2d Vivek Goyal        2021-09-30  855  	} else {
0c9ba9415107060 Vivek Goyal        2021-09-30  856  		fs->nvqs =3D 1 + fs->=
num_request_queues;
0c9ba9415107060 Vivek Goyal        2021-09-30  857  		fs->first_reqq_idx =
=3D 1;
ad41fe942800c2d Vivek Goyal        2021-09-30  858  	}
ad41fe942800c2d Vivek Goyal        2021-09-30  859  =

2ec2b95ff5a4791 Vivek Goyal        2021-09-30  860  	fs->vqs =3D kcalloc(fs=
->nvqs, sizeof(fs->vqs[VQ_HIPRIO_IDX]), GFP_KERNEL);
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  861  	if (!fs->vqs)
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  862  		return -ENOMEM;
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  863  =

2ec2b95ff5a4791 Vivek Goyal        2021-09-30  864  	vqs =3D kmalloc_array(=
fs->nvqs, sizeof(vqs[VQ_HIPRIO_IDX]), GFP_KERNEL);
2ec2b95ff5a4791 Vivek Goyal        2021-09-30  865  	callbacks =3D kmalloc_=
array(fs->nvqs, sizeof(callbacks[VQ_HIPRIO_IDX]),
2ec2b95ff5a4791 Vivek Goyal        2021-09-30  866  					GFP_KERNEL);
2ec2b95ff5a4791 Vivek Goyal        2021-09-30  867  	names =3D kmalloc_arra=
y(fs->nvqs, sizeof(names[VQ_HIPRIO_IDX]),
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  868  			      GFP_KERNEL);
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  869  	if (!vqs || !callbacks=
 || !names) {
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  870  		ret =3D -ENOMEM;
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  871  		goto out;
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  872  	}
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  873  =

b43b7e81eb2b188 Vivek Goyal        2020-08-19  874  	/* Initialize the hipr=
io/forget request virtqueue */
2ec2b95ff5a4791 Vivek Goyal        2021-09-30  875  	callbacks[VQ_HIPRIO_ID=
X] =3D virtio_fs_vq_done;
ad41fe942800c2d Vivek Goyal        2021-09-30  876  	ret =3D virtio_fs_init=
_vq(fs, &fs->vqs[VQ_HIPRIO_IDX], "hiprio",
ad41fe942800c2d Vivek Goyal        2021-09-30  877  				VQ_TYPE_HIPRIO);
ad41fe942800c2d Vivek Goyal        2021-09-30  878  	if (ret < 0)
ad41fe942800c2d Vivek Goyal        2021-09-30  879  		goto out;
2ec2b95ff5a4791 Vivek Goyal        2021-09-30  880  	names[VQ_HIPRIO_IDX] =
=3D fs->vqs[VQ_HIPRIO_IDX].name;
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  881  =

ad41fe942800c2d Vivek Goyal        2021-09-30  882  	/* Initialize notifica=
tion queue */
ad41fe942800c2d Vivek Goyal        2021-09-30  883  	if (fs->notify_enabled=
) {
ad41fe942800c2d Vivek Goyal        2021-09-30  884  		callbacks[VQ_NOTIFY_I=
DX] =3D virtio_fs_vq_done;
ad41fe942800c2d Vivek Goyal        2021-09-30  885  		ret =3D virtio_fs_ini=
t_vq(fs, &fs->vqs[VQ_NOTIFY_IDX],
ad41fe942800c2d Vivek Goyal        2021-09-30  886  					"notification", VQ=
_TYPE_NOTIFY);
ad41fe942800c2d Vivek Goyal        2021-09-30  887  		if (ret < 0)
ad41fe942800c2d Vivek Goyal        2021-09-30  888  			goto out;
ad41fe942800c2d Vivek Goyal        2021-09-30  889  		names[VQ_NOTIFY_IDX] =
=3D fs->vqs[VQ_NOTIFY_IDX].name;
ad41fe942800c2d Vivek Goyal        2021-09-30  890  	}
ad41fe942800c2d Vivek Goyal        2021-09-30  891  =

a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  892  	/* Initialize the requ=
ests virtqueues */
0c9ba9415107060 Vivek Goyal        2021-09-30  893  	for (i =3D fs->first_r=
eqq_idx; i < fs->nvqs; i++) {
b43b7e81eb2b188 Vivek Goyal        2020-08-19  894  		char vq_name[VQ_NAME_=
LEN];
b43b7e81eb2b188 Vivek Goyal        2020-08-19  895  =

0c9ba9415107060 Vivek Goyal        2021-09-30  896  		snprintf(vq_name, VQ_=
NAME_LEN, "requests.%u",
0c9ba9415107060 Vivek Goyal        2021-09-30  897  			 i - fs->first_reqq_=
idx);
ad41fe942800c2d Vivek Goyal        2021-09-30  898  		ret =3D virtio_fs_ini=
t_vq(fs, &fs->vqs[i], vq_name,
ad41fe942800c2d Vivek Goyal        2021-09-30  899  					VQ_TYPE_REQUEST);
ad41fe942800c2d Vivek Goyal        2021-09-30  900  		if (ret < 0)
ad41fe942800c2d Vivek Goyal        2021-09-30  901  			goto out;
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  902  		callbacks[i] =3D virt=
io_fs_vq_done;
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  903  		names[i] =3D fs->vqs[=
i].name;
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  904  	}
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  905  =

a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  906  	ret =3D virtio_find_vq=
s(vdev, fs->nvqs, vqs, callbacks, names, NULL);
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  907  	if (ret < 0)
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  908  		goto out;
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  909  =

a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  910  	for (i =3D 0; i < fs->=
nvqs; i++)
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  911  		fs->vqs[i].vq =3D vqs=
[i];
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  912  out:
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  913  	kfree(names);
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  914  	kfree(callbacks);
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  915  	kfree(vqs);
ad41fe942800c2d Vivek Goyal        2021-09-30  916  	if (ret) {
ad41fe942800c2d Vivek Goyal        2021-09-30  917  		virtio_fs_free_notify=
_nodes(fs);
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  918  		kfree(fs->vqs);
ad41fe942800c2d Vivek Goyal        2021-09-30  919  	}
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  920  	return ret;
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  921  }
a62a8ef9d97da23 Stefan Hajnoczi    2018-06-12  922  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3316362470054749030==--

