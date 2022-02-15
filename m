Content-Type: multipart/mixed; boundary="===============3395359030823332752=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] Virtio-balloon: add user space API for sizing
Date: Tue, 15 Feb 2022 10:10:52 +0800
Message-ID: <202202151007.9aaQbvQc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3395359030823332752==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220214195908.4070138-1-kalutes@google.com>
References: <20220214195908.4070138-1-kalutes@google.com>
TO: Kameron Lutes <kalutes@google.com>
TO: "Michael S . Tsirkin" <mst@redhat.com>
TO: David Hildenbrand <david@redhat.com>
TO: Jason Wang <jasowang@redhat.com>
TO: virtualization(a)lists.linux-foundation.org
TO: linux-kernel(a)vger.kernel.org
TO: virtio-dev(a)lists.oasis-open.org
TO: kvm(a)vger.kernel.org
CC: Suleiman Souhlal <suleiman@chromium.org>
CC: Charles William Dick <cwd@google.com>
CC: Kameron Lutes <kalutes@google.com>

Hi Kameron,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.17-rc4 next-20220214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Kameron-Lutes/Virtio-ballo=
on-add-user-space-API-for-sizing/20220215-050844
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
d567f5db412ed52de0b3b3efca4a451263de6108
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: arm-randconfig-s031-20220214 (https://download.01.org/0day-ci/archi=
ve/20220215/202202151007.9aaQbvQc-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/1ad8c1ce7ded6001b74fd4b7c=
c40957fb5bf05e6
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Kameron-Lutes/Virtio-balloon-add-u=
ser-space-API-for-sizing/20220215-050844
        git checkout 1ad8c1ce7ded6001b74fd4b7cc40957fb5bf05e6
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
rm SHELL=3D/bin/bash drivers/virtio/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/virtio/virtio_balloon.c:892:9: sparse: sparse: no generic select=
ion for 'restricted __le32 virtio_cread_v'
>> drivers/virtio/virtio_balloon.c:892:9: sparse: sparse: incompatible type=
s in comparison expression (different base types):
>> drivers/virtio/virtio_balloon.c:892:9: sparse:    bad type *
   drivers/virtio/virtio_balloon.c:892:9: sparse:    unsigned int *
>> drivers/virtio/virtio_balloon.c:892:9: sparse: sparse: no generic select=
ion for 'restricted __le32 [addressable] virtio_cread_v'

vim +892 drivers/virtio/virtio_balloon.c

71994620bb25a8 Wei Wang      2018-08-16  880  =

1ad8c1ce7ded60 Kameron Lutes 2022-02-14  881  static ssize_t balloon_size_s=
how(struct device *dev,
1ad8c1ce7ded60 Kameron Lutes 2022-02-14  882  				 struct device_attribute =
*attr, char *buf)
1ad8c1ce7ded60 Kameron Lutes 2022-02-14  883  {
1ad8c1ce7ded60 Kameron Lutes 2022-02-14  884  	struct virtio_device *vdev =
=3D container_of(dev, struct virtio_device, dev);
1ad8c1ce7ded60 Kameron Lutes 2022-02-14  885  	u32 num_pages;
1ad8c1ce7ded60 Kameron Lutes 2022-02-14  886  =

1ad8c1ce7ded60 Kameron Lutes 2022-02-14  887  	/*
1ad8c1ce7ded60 Kameron Lutes 2022-02-14  888  	 * Read the size directly fr=
om the balloon's configuration.
1ad8c1ce7ded60 Kameron Lutes 2022-02-14  889  	 * The caller expects the ba=
lloon size enforced by the host,
1ad8c1ce7ded60 Kameron Lutes 2022-02-14  890  	 * not the actual balloon si=
ze
1ad8c1ce7ded60 Kameron Lutes 2022-02-14  891  	 */
1ad8c1ce7ded60 Kameron Lutes 2022-02-14 @892  	virtio_cread(vdev, struct vi=
rtio_balloon_config, num_pages,
1ad8c1ce7ded60 Kameron Lutes 2022-02-14  893  		     &num_pages);
1ad8c1ce7ded60 Kameron Lutes 2022-02-14  894  =

1ad8c1ce7ded60 Kameron Lutes 2022-02-14  895  	return sprintf(buf, "0x%x", =
num_pages);
1ad8c1ce7ded60 Kameron Lutes 2022-02-14  896  }
1ad8c1ce7ded60 Kameron Lutes 2022-02-14  897  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3395359030823332752==--

