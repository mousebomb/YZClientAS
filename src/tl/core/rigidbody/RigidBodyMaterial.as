/**
 * Created by gaord on 2017/3/14.
 */
package tl.core.rigidbody
{
    import away3d.materials.ColorMaterial;

    public class RigidBodyMaterial extends ColorMaterial
    {
        public function RigidBodyMaterial(enforce:EnforceSingleton)
        {
            super(0xcccccc, 0);
        }


        private static var instance:RigidBodyMaterial;

        public static function getInstance():RigidBodyMaterial
        {
            instance ||= new RigidBodyMaterial(new EnforceSingleton);
            return instance;
        }
    }
}
class EnforceSingleton
{
}