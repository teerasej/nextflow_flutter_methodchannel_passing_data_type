package com.example.nextflow_flutter_methodchannel_passing_data_type

class Profile(val id:Int, val isUser:Boolean, val name:String) {

    fun toMap(): HashMap<String,Any?> {
        val map = HashMap<String,Any?>()
        map.put("name", name)
        map.put("isUser", isUser)
        map.put("id", id)
        return map
    }

    companion object {
        fun toMap(profile:Profile): HashMap<String,Any?> {
            val map = HashMap<String,Any?>()
            map.put("name", profile.name)
            map.put("isUser", profile.isUser)
            map.put("id", profile.id)
            return map
        }
        fun parseMap(map: HashMap<String,Any?>): Profile {

            var id: Int = map["id"] as Int;
            var isUser: Boolean = map["isUser"] as Boolean;
            var name: String = map["name"] as String;

            return Profile(id, isUser, name)
        }
    }
}




