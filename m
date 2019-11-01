Content-Type: multipart/mixed; boundary="===============3283461489589933483=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [pm:bleeding-edge 62/70] drivers/acpi/acpica/dbnames.c:576 acpi_db_walk_for_fields() error: double free of 'buffer.pointer'
Date: Fri, 01 Nov 2019 13:28:26 +0300
Message-ID: <20191101102553.GH18421@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3283461489589933483==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git=
 bleeding-edge
head:   aaa43552df9b1f8c788d18df5f5989f8a13433f5
commit: 5fd033288a86676045d9e16243dfc5f988013371 [62/70] ACPICA: debugger: =
add command to dump all fields of particular subtype

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/acpi/acpica/dbnames.c:576 acpi_db_walk_for_fields() error: double f=
ree of 'buffer.pointer'

# https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commi=
t/?id=3D5fd033288a86676045d9e16243dfc5f988013371
git remote add pm https://git.kernel.org/pub/scm/linux/kernel/git/rafael/li=
nux-pm.git
git remote update pm
git checkout 5fd033288a86676045d9e16243dfc5f988013371
vim +576 drivers/acpi/acpica/dbnames.c

5fd033288a8667 Erik Schmauss 2019-10-25  518  static acpi_status
5fd033288a8667 Erik Schmauss 2019-10-25  519  acpi_db_walk_for_fields(acpi_=
handle obj_handle,
5fd033288a8667 Erik Schmauss 2019-10-25  520  			u32 nesting_level, void *c=
ontext, void **return_value)
5fd033288a8667 Erik Schmauss 2019-10-25  521  {
5fd033288a8667 Erik Schmauss 2019-10-25  522  	union acpi_object *ret_value;
5fd033288a8667 Erik Schmauss 2019-10-25  523  	struct acpi_region_walk_info=
 *info =3D
5fd033288a8667 Erik Schmauss 2019-10-25  524  	    (struct acpi_region_walk=
_info *)context;
5fd033288a8667 Erik Schmauss 2019-10-25  525  	struct acpi_buffer buffer;
5fd033288a8667 Erik Schmauss 2019-10-25  526  	acpi_status status;
5fd033288a8667 Erik Schmauss 2019-10-25  527  	struct acpi_namespace_node *=
node =3D acpi_ns_validate_handle(obj_handle);
5fd033288a8667 Erik Schmauss 2019-10-25  528  =

5fd033288a8667 Erik Schmauss 2019-10-25  529  	if (!node) {
5fd033288a8667 Erik Schmauss 2019-10-25  530  		return (AE_OK);
5fd033288a8667 Erik Schmauss 2019-10-25  531  	}
5fd033288a8667 Erik Schmauss 2019-10-25  532  	if (node->object->field.regi=
on_obj->region.space_id !=3D
5fd033288a8667 Erik Schmauss 2019-10-25  533  	    info->address_space_id) {
5fd033288a8667 Erik Schmauss 2019-10-25  534  		return (AE_OK);
5fd033288a8667 Erik Schmauss 2019-10-25  535  	}
5fd033288a8667 Erik Schmauss 2019-10-25  536  =

5fd033288a8667 Erik Schmauss 2019-10-25  537  	info->count++;
5fd033288a8667 Erik Schmauss 2019-10-25  538  =

5fd033288a8667 Erik Schmauss 2019-10-25  539  	/* Get and display the full =
pathname to this object */
5fd033288a8667 Erik Schmauss 2019-10-25  540  =

5fd033288a8667 Erik Schmauss 2019-10-25  541  	buffer.length =3D ACPI_ALLOC=
ATE_LOCAL_BUFFER;
5fd033288a8667 Erik Schmauss 2019-10-25  542  	status =3D acpi_ns_handle_to=
_pathname(obj_handle, &buffer, TRUE);
5fd033288a8667 Erik Schmauss 2019-10-25  543  	if (ACPI_FAILURE(status)) {
5fd033288a8667 Erik Schmauss 2019-10-25  544  		acpi_os_printf("Could Not g=
et pathname for object %p\n",
5fd033288a8667 Erik Schmauss 2019-10-25  545  			       obj_handle);
5fd033288a8667 Erik Schmauss 2019-10-25  546  		return (AE_OK);
5fd033288a8667 Erik Schmauss 2019-10-25  547  	}
5fd033288a8667 Erik Schmauss 2019-10-25  548  =

5fd033288a8667 Erik Schmauss 2019-10-25  549  	acpi_os_printf("%s ", (char =
*)buffer.pointer);
5fd033288a8667 Erik Schmauss 2019-10-25  550  	ACPI_FREE(buffer.pointer);

Freed here.

5fd033288a8667 Erik Schmauss 2019-10-25  551  =

5fd033288a8667 Erik Schmauss 2019-10-25  552  	buffer.length =3D ACPI_ALLOC=
ATE_LOCAL_BUFFER;
5fd033288a8667 Erik Schmauss 2019-10-25  553  	acpi_evaluate_object(obj_han=
dle, NULL, NULL, &buffer);

No error handling here so "buffer.pointer" isn't necessarily modified.

5fd033288a8667 Erik Schmauss 2019-10-25  554  =

5fd033288a8667 Erik Schmauss 2019-10-25  555  	ret_value =3D (union acpi_ob=
ject *)buffer.pointer;
5fd033288a8667 Erik Schmauss 2019-10-25  556  	switch (ret_value->type) {
5fd033288a8667 Erik Schmauss 2019-10-25  557  	case ACPI_TYPE_INTEGER:
5fd033288a8667 Erik Schmauss 2019-10-25  558  =

5fd033288a8667 Erik Schmauss 2019-10-25  559  		acpi_os_printf("%8.8X%8.8X",
5fd033288a8667 Erik Schmauss 2019-10-25  560  			       ACPI_FORMAT_UINT64(=
ret_value->integer.value));
5fd033288a8667 Erik Schmauss 2019-10-25  561  		break;
5fd033288a8667 Erik Schmauss 2019-10-25  562  =

5fd033288a8667 Erik Schmauss 2019-10-25  563  	case ACPI_TYPE_BUFFER:
5fd033288a8667 Erik Schmauss 2019-10-25  564  =

5fd033288a8667 Erik Schmauss 2019-10-25  565  		acpi_ut_dump_buffer(ret_val=
ue->buffer.pointer,
5fd033288a8667 Erik Schmauss 2019-10-25  566  				    ret_value->buffer.len=
gth,
5fd033288a8667 Erik Schmauss 2019-10-25  567  				    DB_DISPLAY_DATA_ONLY =
| DB_BYTE_DISPLAY, 0);
5fd033288a8667 Erik Schmauss 2019-10-25  568  		break;
5fd033288a8667 Erik Schmauss 2019-10-25  569  =

5fd033288a8667 Erik Schmauss 2019-10-25  570  	default:
5fd033288a8667 Erik Schmauss 2019-10-25  571  =

5fd033288a8667 Erik Schmauss 2019-10-25  572  		break;
5fd033288a8667 Erik Schmauss 2019-10-25  573  	}
5fd033288a8667 Erik Schmauss 2019-10-25  574  	acpi_os_printf("\n");
5fd033288a8667 Erik Schmauss 2019-10-25  575  =

5fd033288a8667 Erik Schmauss 2019-10-25 @576  	ACPI_FREE(buffer.pointer);

Double free.

5fd033288a8667 Erik Schmauss 2019-10-25  577  =

5fd033288a8667 Erik Schmauss 2019-10-25  578  	return (AE_OK);
5fd033288a8667 Erik Schmauss 2019-10-25  579  }

---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on
--===============3283461489589933483==--

